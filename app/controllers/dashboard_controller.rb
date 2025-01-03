class DashboardController < ApplicationController
  before_action :authenticate_contact!

  def index
  end
end