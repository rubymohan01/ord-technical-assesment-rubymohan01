class CompaniesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_company, only: [:update, :edit, :show, :destroy]

	def index
		@companies = Company.all
    respond_to do |format|
      format.html # For full page requests
      format.turbo_stream { render partial: 'companies/index', locals: { companies: @companies } }
    end
	end
	
	def edit
	end

  def show
  end

	def create
		@company = Company.new(company_params)
		if @company.save
			redirect_to @company, notice: 'company was successfully created.'
		else
			render :new
		end
	end

	def update
		if @company.update(company_params)
			redirect_to @company, notice: 'company was successfully updated.'
		else
			render :edit
		end
	end

	def destroy
		@company.destroy
		redirect_to companys_url, notice: 'company was successfully destroyed.'
	end

	private
  
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:id, :name, :email, :phone, :address_line_1, :address_line_2, :city, :state, :country, :zip, :website, :industry, :created_at, :updated_at)
  end
end
