require 'csv'

class CsvImportJob < ApplicationJob
  queue_as :default

  def perform(file_path, company_id)
    begin
      company = Company.find(company_id)
      rows = CSV.read(file_path, headers: true)
      total_rows = rows.size
      rows_processed = 0
      rows_failed = 0

      rows.each_with_index do |row, index|
        progress = ((index + 1).to_f / total_rows * 100).round

        employee = Employee.new(
          first_name: row["First Name"],
          last_name: row["Last Name"],
          email: row["Email"],
          phone: row["Phone"],
          job_title: row["Job Title"],
          dob: row["DOB (YYYY/mm/dd)"],
          gender: row["Gender"],
          company: company
        )
        if employee.save
          rows_processed += 1
        else
          rows_failed += 1
        end

        Turbo::StreamsChannel.broadcast_replace_to(
          "progress-container",
          target: "progress-bar",
          partial: "csv_imports/progress",
          locals: { progress: progress }
        )

        Turbo::StreamsChannel.broadcast_replace_to(
          "progress-container",
          target: "import-status",
          partial: "csv_imports/success_message",
          locals: { message: "Import in progress... Total Rows: #{total_rows}, Processed: #{rows_processed}, Failed: #{rows_failed}" }
        )
      end

      Turbo::StreamsChannel.broadcast_replace_to(
        "progress-container",
        target: "import-status",
        partial: "csv_imports/success_message",
        locals: { message: "Employees Imported successfully! #{rows_processed} / #{total_rows} rows processed, #{rows_failed} rows failed." }
      )
    rescue StandardError => e
      Turbo::StreamsChannel.broadcast_replace_to(
        "progress-container",
        target: "progress-bar",
        partial: "csv_imports/progress",
        locals: { progress: 100 }
      )
      Turbo::StreamsChannel.broadcast_replace_to(
        "progress-container",
        target: "import-status",
        partial: "csv_imports/error_message",
        locals: { message: "Error processing CSV file: #{e.message}" }
      )

      sleep(10)

      Turbo::StreamsChannel.broadcast_replace_to(
        "progress-container",
        target: "progress-bar",
        partial: "csv_imports/progress",
        locals: { progress: 0 }
      )

      Turbo::StreamsChannel.broadcast_replace_to(
        "progress-container",
        target: "import-status",
        partial: "csv_imports/success_message",
        locals: { message: "" }
      )
    ensure
      if File.exist?(file_path)
        File.delete(file_path)
        Rails.logger.info "Deleted temporary file: #{file_path}"
      end
    end
  end
end
