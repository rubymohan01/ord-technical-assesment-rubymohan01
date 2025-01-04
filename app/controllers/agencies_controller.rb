class AgenciesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_agency, only: [:edit, :update, :show, :destroy]

  def new
    @agency = Agency.new
    @agency.build_contact
  
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("tab-content", partial: 'agencies/form', locals: { agency: @agency })
      end
    end
  end  

  def index
    @agencies = Agency.all
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("tab-content", partial: "agencies/index", locals: { agencies: @agencies })
      end
    end
  end
  
  def edit
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("tab-content", partial: "agencies/form", locals: { agency: @agency })
      end
    end
  end

  def show
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("tab-content", partial: "agencies/details", locals: { agency: @agency })
      end
    end
  end

  def create
    updated_params = agency_params
    temp_password = SecureRandom.hex(8)
    updated_params[:contact_attributes] = updated_params[:contact_attributes].merge(password: temp_password, password_confirmation: temp_password)
    @agency = Agency.new(updated_params)
    if @agency.save
      respond_to do |format|
        format.turbo_stream do
          redirect_to agencies_path
        end
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("tab-content", partial: "agencies/form", locals: { agency: @agency })
        end
      end
    end
  end

  def update
    if @agency.update(agency_params)
      respond_to do |format|
        format.turbo_stream do
          redirect_to agencies_path
        end
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("tab-content", partial: "agencies/form", locals: { agency: @agency })
        end
      end
    end
  end

  def destroy
    @agency.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove("agency_#{@agency.id}")
      end
    end
  end

  private

  def set_agency
    @agency = Agency.find(params[:id])
  end

  def agency_params
    params.require(:agency).permit(:name, :email, :phone, :address_line_1, :address_line_2, :city, :state, :country, :zip, :website, contact_attributes: [:id, :first_name, :last_name, :email, :phone])
  end
end
