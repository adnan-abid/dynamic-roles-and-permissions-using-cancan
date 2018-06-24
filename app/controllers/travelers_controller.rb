class TravelersController < ApplicationController
  before_action :authenticate_user!
  before_action :traveler_only
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
  def traveler_only
    unless current_user.traveler?
      #redirect_to new_user_session_path, :alert => "Access denied."
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
