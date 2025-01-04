class AgentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_agency, only: [:new]
  before_action :set_agent, only: [:edit, :update, :show, :destroy]

  def new
    @agent = @agency.agents.new 
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("tab-content", partial: 'agents/form', locals: { agent: @agent, agency: @agency })
      end
    end
  end
  
  def edit
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("tab-content", partial: "agents/form", locals: { agent: @agent, agency: @agent.agency })
      end
    end
  end

  def show
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("tab-content", partial: "agents/details", locals: { agent: @agent })
      end
    end
  end

  def create
    @agent = Agent.new(agent_params)
    @agency = Agency.find(agent_params[:agency_id])
    if @agent.save
      respond_to do |format|
        format.turbo_stream do
          redirect_to agency_path(@agent.agency)
        end
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("tab-content", partial: "agents/form", locals: { agent: @agent, agency: @agency })
        end
      end
    end
  end

  def update
    if @agent.update(agent_params)
      respond_to do |format|
        format.turbo_stream do
          redirect_to agency_path(@agent.agency)
        end
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("tab-content", partial: "agents/form", locals: { agent: @agent, agency: @agent.agency })
        end
      end
    end
  end

  def destroy
    @agent.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove("agent_#{@agent.id}")
      end
    end
  end

  private
  
  def set_agent
    @agent = Agent.find(params[:id])
  end

  def set_agency
    @agency = Agency.find(params[:agency_id])
  end

  def agent_params
    params.require(:agent).permit(:first_name, :last_name, :email, :phone, :gender, :dob, :agency_id)
  end
end
  