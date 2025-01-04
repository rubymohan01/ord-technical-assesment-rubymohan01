class EmployeesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_company, only: [:new]
  before_action :set_employee, only: [:edit, :update, :show, :destroy]

  def new
    @employee = @company.employees.new 
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("tab-content", partial: 'employees/form', locals: { employee: @employee, company: @company })
      end
    end
  end
  
  def edit
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("tab-content", partial: "employees/form", locals: { employee: @employee, company: @employee.company })
      end
    end
  end

  def show
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("tab-content", partial: "employees/details", locals: { employee: @employee })
      end
    end
  end

  def create
    @employee = Employee.new(employee_params)
    @company = Company.find(employee_params[:company_id])
    if @employee.save
      respond_to do |format|
        format.turbo_stream do
          redirect_to company_path(@employee.company)
        end
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("tab-content", partial: "employees/form", locals: { employee: @employee, company: @company })
        end
      end
    end
  end

  def update
    if @employee.update(employee_params)
      respond_to do |format|
        format.turbo_stream do
          redirect_to company_path(@employee.company)
        end
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("tab-content", partial: "employees/form", locals: { employee: @employee, company: @employee.company })
        end
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove("employee_#{@employee.id}")
      end
    end
  end

  private
  
  def set_employee
    @employee = Employee.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :phone, :gender, :dob, :job_title, :company_id)
  end
end
