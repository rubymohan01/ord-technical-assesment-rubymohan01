class Contact < ApplicationRecord
  devise :database_authenticatable, :recoverable, :validatable
  belongs_to :contactable, polymorphic: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :phone, presence: true, length: { minimum: 10, maximum: 15 }, numericality: { only_integer: true }
end
