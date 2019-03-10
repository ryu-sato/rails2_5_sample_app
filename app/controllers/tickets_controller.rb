class TicketsController < ApplicationController
  before_action :set_ticket, only: [:destroy]
  before_action :set_ticket_with_preload, only: [:show]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @diff_sets = DiffSet.where(ticket_id: @ticket&.id)
    if @diff_sets.blank?
      # Create lock
      GeneratingTicket.with_advisory_lock("#{@ticket.code}_#{@ticket.host}_#{@ticket.normal_log.id}_#{@ticket.abnormal_log.id}") do
        logger.debug "#{@ticket.code}_#{@ticket.host}_#{@ticket.normal_log.id}_#{@ticket.abnormal_log.id}"
        if GeneratingTicket.exists?(ticket_code: @ticket.code, hostname: @ticket.host.to_s, normal_raw_log_id: @ticket.normal_log.id, abnormal_raw_log_id: @ticket.abnormal_log.id)
          logger.info "already generating ticket. #{@ticket.code}_#{@ticket.host}_#{@ticket.normal_log.id}_#{@ticket.abnormal_log.id}"
          render 'show' and return
        end
        GeneratingTicket.create!(ticket_code: @ticket.code, hostname: @ticket.host, normal_raw_log_id: @ticket.normal_log.id, abnormal_raw_log_id: @ticket.abnormal_log.id)
      end

      # Generate ticket
      GenerateTicketJob.set(wait: 1.minute).perform_later @ticket
    end
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
p "ticket_params: #{ticket_params}"
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
end
