require 'csv'

namespace :csv do
  desc "read CSV file"
  task :read, ['csv_file_path', 'search_keyword'] => :environment do |task, args|
    Rails.logger.info 'at least two arguments required.' && exit(1) if args.count < 2

    csv_file_path = args['csv_file_path']
    search_keyword = args['search_keyword']
    
    Rails.logger.warning "file #{csv_file_path} must be CSV." && exit(1) unless File.file?(csv_file_path) && File.extname(csv_file_path) =~ /\.csv/i

    all_csv_data = CSV.read(csv_file_path, headers: true)
    matched_row = all_csv_data.select {|row| row.field?(search_keyword)}

    pp matched_row
  end
end
