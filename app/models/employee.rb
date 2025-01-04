class Employee < ApplicationRecord
  belongs_to :company
  before_validation :set_employee_id, on: :create 
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :phone, presence: true, length: { minimum: 10, maximum: 15 }, numericality: { only_integer: true }
  validates :job_title, presence: true
  validates :dob, presence: true
  validates :ref_code, presence: true
  validates :gender, presence: true

  def set_employee_id
    company_prefix = company.name[0, 3].upcase
    employee_count = company.employees.count + 1
    padded_number = employee_count.to_s.rjust(3, '0')
    self.ref_code = "#{company_prefix}#{padded_number}"
  end
end
