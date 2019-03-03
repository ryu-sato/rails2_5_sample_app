require 'zip'

class RawLogsController < ApplicationController
  before_action :set_raw_log, only: [:show, :destroy, :download]

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
  
  # GET /raw_logs/1/download
  def download
    ticket_num = @raw_log.ticket
    host = @raw_log.host
    file_name = "#{ticket_num}-#{host}.zip"
    @input_dir = File.join(Rails.root, 'public', 'log')

    # binding.pry
    Dir.mktmpdir do |tmpdir|
      entries = Dir.entries(@input_dir) - %w(. ..)

      zip_path = File.join(tmpdir, 'download.zip')
      ::Zip::File.open(zip_path, ::Zip::File::CREATE) do |zipfile|
        write_entries entries, '', zipfile
      end
      send_data File.read(zip_path), type: 'application/zip', disposition: 'attachment', filename: file_name
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

    # see. https://github.com/rubyzip/rubyzip#basic-zip-archive-creation
    # A helper method to make the recursion work.
    def write_entries(entries, path, zipfile)
      entries.each do |e|
        zipfile_path = path == '' ? e : File.join(path, e)
        disk_file_path = File.join(@input_dir, zipfile_path)
        logger.debug "Deflating #{disk_file_path}"

        if File.directory? disk_file_path
          recursively_deflate_directory(disk_file_path, zipfile, zipfile_path)
        else
          put_into_archive(disk_file_path, zipfile, zipfile_path)
        end
      end
    end

    # see. https://github.com/rubyzip/rubyzip#basic-zip-archive-creation
    def recursively_deflate_directory(disk_file_path, zipfile, zipfile_path)
      zipfile.mkdir zipfile_path
      subdir = Dir.entries(disk_file_path) - %w(. ..)
      write_entries subdir, zipfile_path, zipfile
    end

    # see. https://github.com/rubyzip/rubyzip#basic-zip-archive-creation
    def put_into_archive(disk_file_path, zipfile, zipfile_path)
      zipfile.get_output_stream(zipfile_path) do |f|
        f.write(File.open(disk_file_path, 'rb').read)
      end
    end
end
