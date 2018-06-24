class AgentsController < ApplicationController
  before_action :authenticate_user!
  before_action :agent_only
  layout :resolve_layout
  
  def dashboard
  end
  
  def profile
  end
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  private
  def agent_only
    unless current_user.agent?
      #redirect_to agent_path, :alert => "Access denied."
      access_denied!
    end
  end
  def resolve_layout
    case action_name
    when "profile"
      "profile"
    when "dashboard"
      "dashboard_agent"
    else
      "application"
    end
  end
end
