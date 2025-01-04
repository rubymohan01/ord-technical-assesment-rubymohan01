class AgenciesController < ApplicationController
  def index
    @agencies = Agency.all
    respond_to do |format|
      format.html
      format.turbo_stream { render partial: 'agencies/index', locals: { agencies: @agencies } }
    end
  end
end
