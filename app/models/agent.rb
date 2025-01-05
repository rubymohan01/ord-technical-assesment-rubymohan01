class Agent < ApplicationRecord
  belongs_to :agency
  before_validation :set_agent_id, on: :create 
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :phone, presence: true, length: { minimum: 10, maximum: 15 }
  validates :dob, presence: true
  validates :ref_code, presence: true
  validates :gender, presence: true

  def set_agent_id
    agency_prefix = agency.name[0, 3].upcase
    agent_count = agency.agents.count + 1
    padded_number = agent_count.to_s.rjust(3, '0')
    self.ref_code = "#{agency_prefix}#{padded_number}"
  end
end
