class CsvImportService
  attr_accessor :csv_file, :company_id

  def initialize(params)
    @csv_file = Rails.root.join('tmp', params[:file].original_filename)
    @company_id = params[:company_id]
    save_file(params[:file])
  end

  def save_file(temp_file)
    File.open(@csv_file, 'wb') do |file|
      file.write(temp_file.read)
    end
  end

  def process
    CsvImportJob.perform_later(@csv_file.to_s, company_id)
  end
end