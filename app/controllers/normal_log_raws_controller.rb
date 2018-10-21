class NormalLogRawsController < ApplicationController
  before_action :set_normal_log_raw, only: [:destroy]

  # GET /normal_log_raws
  # GET /normal_log_raws.json
  def index
    @normal_log_raws = NormalLogRaw.all
  end

  # GET /normal_log_raws/new
  def new
    @normal_log_raw = NormalLogRaw.new
  end

  # POST /normal_log_raws
  # POST /normal_log_raws.json
  def create
    @normal_log_raw = NormalLogRaw.new(normal_log_raw_params)

    respond_to do |format|
      if @normal_log_raw.save
        format.html { redirect_to normal_log_raws_path, notice: 'Normal log raw was successfully created.' }
        format.json { render :index, status: :created }
      else
        format.html { render :new }
        format.json { render json: @normal_log_raw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /normal_log_raws/1
  # DELETE /normal_log_raws/1.json
  def destroy
    @normal_log_raw.raw_log.purge
    @normal_log_raw.destroy
    respond_to do |format|
      format.html { redirect_to normal_log_raws_url, notice: 'Normal log raw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_normal_log_raw
      @normal_log_raw = NormalLogRaw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def normal_log_raw_params
      params.require(:normal_log_raw).permit(:raw_log, :hostname)
    end
end
