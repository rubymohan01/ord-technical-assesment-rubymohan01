class Company < ApplicationRecord
  has_many :employees
  has_many :policies
  has_one :contact, as: :contactable
end
