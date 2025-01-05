require 'csv'
class CsvImportsController < ApplicationController
  def new
    render turbo_stream: turbo_stream.replace("modal", partial: "csv_imports/new", locals: { company_id: params[:company_id] })
  end

  def create
    CsvImportService.new(params).process

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("progress-bar", partial: "csv_imports/progress", locals: { progress: 1 }),
          turbo_stream.replace("modal", partial: "layouts/shared/empty_modal")
        ]
      end
    end
  end
end
  