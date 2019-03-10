class GenerateTicketJob < ApplicationJob
  queue_as :default

  def perform(*args)
    p "Generate Ticket Job", args

    ticket = args[0]
p ticket

    ps = ProcessorService.instance
    diff_sets = ticket.diff_sets

    ActiveRecord::Base.transaction do
      # 解析結果を削除する
p "diff_sets.destroy_all"
      diff_sets.destroy_all
      ticket.raw_logs.each {|raw_log| raw_log.command_log_sets.destroy_all }

p "blob = ticket.abnormal_log.raw_log.blob"
      blob = ticket.abnormal_log.raw_log.blob
      log_content = IO.read(blob.service.send(:path_for, blob.key))
      anomaly_cmdset = CommandLogSet.create!(phase: 'parsed_and_no_unused_values',
                                              raw_log: ticket.abnormal_log)
      ps.parse_commands(log_content).each do |hash|
        anomaly_cmdset.command_logs << CommandLog.create!(name: hash[:name], result: hash[:result])
      end

p "blob = ticket.normal_log.raw_log.blob"
      blob = ticket.normal_log.raw_log.blob
      log_content = IO.read(blob.service.send(:path_for, blob.key))
      normal_cmdset = CommandLogSet.create!(phase: 'parsed_and_no_unused_values',
                                             raw_log: ticket.normal_log)
      ps.parse_commands(log_content).each do |hash|
        normal_cmdset.command_logs << CommandLog.create!(name: hash[:name], result: hash[:result])
      end

p "diff_summary = ps.compare_command_sets(normal_cmdset, anomaly_cmdset)"
      diff_summary = ps.compare_command_sets(normal_cmdset, anomaly_cmdset)
      diffset = DiffSet.create!(ticket_id: ticket.id, phase: 'parsed_and_no_unused_values', diff_summary: diff_summary)

      anomaly_cmdset.command_logs.each do |anomaly_log|
        normal_log = normal_cmdset.command_logs.find_by(name: anomaly_log.name)
        next if normal_log.blank?
        diff = ps.compare_command(normal_log, anomaly_log)
        diffset.diff_units << DiffUnit.create!(name: anomaly_log.name, diff: diff,
                                                normal_log: normal_log.result, abnormal_log: anomaly_log.result)
      end
p diffset
p diffset.errors

p "anomaly_cmdset_ph2 = CommandLogSet.create(phase: 'removed_flow_values', raw_log: ticket.abnormal_log)"
      anomaly_cmdset_ph2 = CommandLogSet.create!(phase: 'removed_flow_values',
                                                  raw_log: ticket.abnormal_log)
      anomaly_cmdset.command_logs.each do |cmd|
        method_name = ps.replace_method_name(cmd.name)
        result = ps.send(method_name, cmd.result)
        anomaly_cmdset_ph2.command_logs << CommandLog.create!(name: cmd.name, result: result.presence || cmd.result)
      end

p "normal_cmdset_ph2 = CommandLogSet.create(phase: 'removed_flow_values', raw_log: ticket.normal_log)"
      normal_cmdset_ph2 = CommandLogSet.create!(phase: 'removed_flow_values',
                                                 raw_log: ticket.normal_log)
      normal_cmdset.command_logs.each do |cmd|
        method_name = ps.replace_method_name(cmd.name)
        result = ps.send(method_name, cmd.result)
        normal_cmdset_ph2.command_logs << CommandLog.create!(name: cmd.name, result: result.presence || cmd.result)
      end

p "diff_summary = ps.compare_command_sets(normal_cmdset_ph2, anomaly_cmdset_ph2)"
      diff_summary = ps.compare_command_sets(normal_cmdset_ph2, anomaly_cmdset_ph2)
      diffset2 = DiffSet.create!(ticket_id: ticket.id, phase: 'removed_flow_values', diff_summary: diff_summary)

      anomaly_cmdset_ph2.command_logs.each do |anomaly_log|
        normal_log = normal_cmdset_ph2.command_logs.find_by(name: anomaly_log.name)
        next if normal_log.blank?
        diff = ps.compare_command(normal_log, anomaly_log)
        diffset2.diff_units << DiffUnit.create!(name: anomaly_log.name, diff: diff,
                                                 normal_log: normal_log.result, abnormal_log: anomaly_log.result)
      end
p diffset2
p diffset2.errors
    end
  end
end
