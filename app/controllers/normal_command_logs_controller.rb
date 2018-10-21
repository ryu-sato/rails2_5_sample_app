class NormalCommandLogsController < ApplicationController
  # GET /normal_command_logs/1
  # GET /normal_command_logs/1.json
  def show
    @normal_command_log = NormalCommandLog.find(params[:id])
  end
end
