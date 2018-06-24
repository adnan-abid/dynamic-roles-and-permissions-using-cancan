class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show
  layout :resolve_layout

  def index
    @users = User.all
    #raise @users.to_yaml
    #raise @users.inspect
    #logger.debug "New article: #{@users.inspect}"
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_path, :alert => "Access denied."
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless current_user.super_admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end

  def resolve_layout
    case action_name
    when "new", "create"
      "application"
    when "index"
      "dashboard_superadmin"
    else
      "application"
    end
  end

end
