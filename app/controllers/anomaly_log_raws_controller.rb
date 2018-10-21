class AnomalyLogRawsController < ApplicationController
  before_action :set_anomaly_log_raw, only: [:destroy]

  # GET /anomaly_log_raws
  # GET /anomaly_log_raws.json
  def index
    @anomaly_log_raws = AnomalyLogRaw.all
  end

  # GET /anomaly_log_raws/new
  def new
    @anomaly_log_raw = AnomalyLogRaw.new
  end

  # POST /anomaly_log_raws
  # POST /anomaly_log_raws.json
  def create
    @anomaly_log_raw = AnomalyLogRaw.new(anomaly_log_raw_params)

    respond_to do |format|
      if @anomaly_log_raw.save
        format.html { redirect_to anomaly_log_raws_path, notice: 'Anomaly log raw was successfully created.' }
        format.json { render :index, status: :created }
      else
        format.html { render :new }
        format.json { render json: @anomaly_log_raw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anomaly_log_raws/1
  # DELETE /anomaly_log_raws/1.json
  def destroy
    @anomaly_log_raw.destroy
    respond_to do |format|
      format.html { redirect_to anomaly_log_raws_url, notice: 'Anomaly log raw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anomaly_log_raw
      @anomaly_log_raw = AnomalyLogRaw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anomaly_log_raw_params
      params.require(:anomaly_log_raw).permit(:raw_log, :hostname)
    end
end
