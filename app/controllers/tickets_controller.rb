class TicketsController < ApplicationController
  before_action :set_ticket, only: [:destroy]
  before_action :set_ticket_with_preload, only: [:show]
  before_action :execute_generating_ticket_job, only: [:show]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @diff_sets = DiffSet.where(ticket_id: @ticket&.id)
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.errors.size == 0 && @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def set_ticket_with_preload
      @ticket = Ticket.preload(raw_logs: :command_log_sets)
                  .find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:code, :host_id, raw_log_ids: [])
    end

    def execute_generating_ticket_job
      GenerateTicketJob.set(wait: 5.second).perform_later
    end

    def generate_comparison_if_not_exist
      ps = ProcessorService.instance
      @diff_sets = @ticket.diff_sets

      # [TODO] 本番では元戻しする (強制再生成するようコメントアウトしている)
      return if @diff_sets.present?

      ActiveRecord::Base.transaction do
        @diff_sets.destroy_all
        @ticket.raw_logs.each {|raw_log| raw_log.command_log_sets.destroy_all }

        blob = @ticket.abnormal_log.raw_log.blob
        log_content = IO.read(blob.service.send(:path_for, blob.key))
        anomaly_cmdset = CommandLogSet.create(phase: 'parsed_and_no_unused_values',
                                                raw_log: @ticket.abnormal_log)
        ps.parse_commands(log_content).each do |hash|
          anomaly_cmdset.command_logs << CommandLog.create(name: hash[:name], result: hash[:result])
        end

        blob = @ticket.normal_log.raw_log.blob
        log_content = IO.read(blob.service.send(:path_for, blob.key))
        normal_cmdset = CommandLogSet.create(phase: 'parsed_and_no_unused_values',
                                               raw_log: @ticket.normal_log)
        ps.parse_commands(log_content).each do |hash|
          normal_cmdset.command_logs << CommandLog.create(name: hash[:name], result: hash[:result])
        end

        diff_summary = ps.compare_command_sets(normal_cmdset, anomaly_cmdset)
        diffset = DiffSet.create(ticket_id: @ticket.id, phase: 'parsed_and_no_unused_values', diff_summary: diff_summary)

        anomaly_cmdset.command_logs.each do |anomaly_log|
          normal_log = normal_cmdset.command_logs.find_by(name: anomaly_log.name)
          next if normal_log.blank?
          diff = ps.compare_command(normal_log, anomaly_log)
          diffset.diff_units << DiffUnit.create(name: anomaly_log.name, diff: diff,
                                                  normal_log: normal_log.result, abnormal_log: anomaly_log.result)
        end


        anomaly_cmdset_ph2 = CommandLogSet.create(phase: 'removed_flow_values',
                                                    raw_log: @ticket.abnormal_log)
        anomaly_cmdset.command_logs.each do |cmd|
          method_name = ps.replace_method_name(cmd.name)
          result = ps.send(method_name, cmd.result)
          anomaly_cmdset_ph2.command_logs << CommandLog.create(name: cmd.name, result: result.presence || cmd.result)
        end

        normal_cmdset_ph2 = CommandLogSet.create(phase: 'removed_flow_values',
                                                   raw_log: @ticket.normal_log)
        normal_cmdset.command_logs.each do |cmd|
          method_name = ps.replace_method_name(cmd.name)
          result = ps.send(method_name, cmd.result)
          normal_cmdset_ph2.command_logs << CommandLog.create(name: cmd.name, result: result.presence || cmd.result)
        end

        diff_summary = ps.compare_command_sets(normal_cmdset_ph2, anomaly_cmdset_ph2)
        diffset2 = DiffSet.create(ticket_id: @ticket.id, phase: 'removed_flow_values', diff_summary: diff_summary)

        anomaly_cmdset_ph2.command_logs.each do |anomaly_log|
          normal_log = normal_cmdset_ph2.command_logs.find_by(name: anomaly_log.name)
          next if normal_log.blank?
          diff = ps.compare_command(normal_log, anomaly_log)
          diffset2.diff_units << DiffUnit.create(name: anomaly_log.name, diff: diff,
                                                   normal_log: normal_log.result, abnormal_log: anomaly_log.result)
        end
      end
    end
end
