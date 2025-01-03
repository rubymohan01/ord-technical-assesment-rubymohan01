class Contact < ApplicationRecord
  devise :database_authenticatable, :recoverable, :validatable
  belongs_to :contactable, polymorphic: true
end
