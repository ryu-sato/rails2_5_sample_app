class TicketsController < ApplicationController
  before_action :set_ticket, only: [:destroy]
  before_action :set_ticket_with_preload, only: [:show]
  before_action :generate_comparison, only: [:show]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @comparison_sets = ComparisonSet.where(id: @ticket.normal_log_raw.normal_command_log_set_ids)
    # [TODO] 実装
    @comparison_units = []
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
      @ticket = Ticket.preload(normal_log_raw: :normal_command_log_sets)
                  .find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:code, :maker, :hostname, :normal_log_raw_id, :anomaly_log_raw_id)
    end

    def generate_comparison
      ps = ProcessorService.instance

      ActiveRecord::Base.transaction do
        blob = @ticket.anomaly_log_raw.raw_log.blob
        log_content = IO.read(blob.service.send(:path_for, blob.key))
        anomaly_cmdset = AnomalyCommandLogSet.create(
          phase: 'parsed_and_no_unused_values',
          anomaly_log_raw: @ticket.anomaly_log_raw
        )
        ps.parse_commands(log_content).each do |hash|
          anomaly_cmdset.anomaly_command_logs << AnomalyCommandLog.create(name: hash[:name], result: hash[:result])
        end

        blob = @ticket.normal_log_raw.raw_log.blob
        log_content = IO.read(blob.service.send(:path_for, blob.key))
        normal_cmdset = NormalCommandLogSet.create(
          phase: 'parsed_and_no_unused_values',
          normal_log_raw: @ticket.normal_log_raw
        )
        ps.parse_commands(log_content).each do |hash|
          normal_cmdset.normal_command_logs << NormalCommandLog.create(name: hash[:name], result: hash[:result])
        end
      end
    end
end
