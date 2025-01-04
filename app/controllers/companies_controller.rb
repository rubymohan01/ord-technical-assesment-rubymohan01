class CompaniesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_company, only: [:edit, :update, :show, :destroy]

  def new
    @company = Company.new
    @company.build_contact
  
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("tab-content", partial: 'companies/form', locals: { company: @company })
      end
    end
  end  

  def index
    @companies = Company.all
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("tab-content", partial: "companies/index", locals: { companies: @companies })
      end
    end
  end
  
  def edit
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("tab-content", partial: "companies/form", locals: { company: @company })
      end
    end
  end

  def show
  end

  def create
    updated_params = company_params
    temp_password = SecureRandom.hex(8)
    updated_params[:contact_attributes] = updated_params[:contact_attributes].merge(password: temp_password, password_confirmation: temp_password)
    @company = Company.new(updated_params)
    if @company.save
      respond_to do |format|
        format.turbo_stream do
          redirect_to companies_path
        end
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("tab-content", partial: "companies/form", locals: { company: @company })
        end
      end
    end
  end

  def update
    if @company.update(company_params)
      respond_to do |format|
        format.turbo_stream do
          redirect_to companies_path
        end
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("tab-content", partial: "companies/form", locals: { company: @company })
        end
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove("company_#{@company.id}")
      end
    end
  end

  private
  
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :email, :phone, :address_line_1, :address_line_2, :city, :state, :country, :zip, :website, :industry, contact_attributes: [:id, :first_name, :last_name, :email, :phone])
  end
end
