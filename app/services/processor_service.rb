require 'fileutils'

class ProcessorService
  include Singleton

  def parse_commands(log)
    separator = '#####SEPARATOR#####'

    log.gsub(/(.*@)(mx960-01-hon>\s*)/, separator)
      .split(separator)
      .inject([]) do |cmd_logs, block|
        result = block.lines
        name = result.slice!(0).chomp

        next cmd_logs if name.blank? || result.blank?

        cmd_logs << {
          name: name,
          result: result.join
        }
      end
  end

  def compare_command_sets(normal_cmdset, anomaly_cmdset)
    normal_log_string = normal_cmdset.normal_command_logs.map(&:result).join
    anomaly_log_string = anomaly_cmdset.anomaly_command_logs.map(&:result).join
    Diffy::Diff.new(normal_log_string, anomaly_log_string)
  end

  def compare_command(normal_log, anomaly_log)
    Diffy::Diff.new(normal_log.result, anomaly_log.result)
  end
end
