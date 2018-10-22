class CommandLogsController < ApplicationController
  # GET /command_logs/1
  # GET /command_logs/1.json
  def show
    @command_log = CommandLog.find(params[:id])
  end
end
