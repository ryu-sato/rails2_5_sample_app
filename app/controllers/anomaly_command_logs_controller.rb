class AnomalyCommandLogsController < ApplicationController
  # GET /anomaly_command_logs/1
  # GET /anomaly_command_logs/1.json
  def show
    @anomaly_command_log = AnomalyCommandLog.find(params[:id])
  end
end
