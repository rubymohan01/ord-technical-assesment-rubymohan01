class Company < ApplicationRecord
  has_many :employees, dependent: :destroy
  has_many :policies
  has_one :contact, as: :contactable, dependent: :destroy
  accepts_nested_attributes_for :contact, allow_destroy: true

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, length: { minimum: 10, maximum: 15 }, numericality: { only_integer: true }
  validates :address_line_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :zip, presence: true, format: { with: /\A[A-Za-z0-9]{5,10}\z/, message: "must be alphanumeric and between 5 to 10 characters long" }
  validates :website, allow_blank: true, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "must be a valid URL" }

  def full_address
    [address_line_1, address_line_2, city, state, country, zip].compact.join(', ')
  end
end
