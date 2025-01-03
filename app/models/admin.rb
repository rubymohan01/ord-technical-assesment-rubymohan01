class Admin < ApplicationRecord
  devise :database_authenticatable, :recoverable, :validatable
end
