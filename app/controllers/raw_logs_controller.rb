class RawLogsController < ApplicationController
  before_action :set_raw_log, only: [:show, :destroy]

  # GET /raw_logs
  # GET /raw_logs.json
  def index
    @raw_logs = RawLog.all
  end

  # GET /raw_logs/1
  # GET /raw_logs/1.json
  def show
  end

  # GET /raw_logs/new
  def new
    @raw_log = RawLog.new
  end

  # POST /raw_logs
  # POST /raw_logs.json
  def create
    @raw_log = RawLog.new(raw_log_params)

    respond_to do |format|
      if @raw_log.save
        format.html { redirect_to raw_logs_url, notice: 'Raw log was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @raw_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_logs/1
  # DELETE /raw_logs/1.json
  def destroy
    @raw_log.destroy
    respond_to do |format|
      format.html { redirect_to raw_logs_url, notice: 'Raw log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_log
      @raw_log = RawLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raw_log_params
      params.fetch(:raw_log, {}).permit(:host_id, :raw_log, :log_type, :acquisition_date)
    end
end
