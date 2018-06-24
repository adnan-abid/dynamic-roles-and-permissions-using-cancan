class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  #before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:home, :about, :contact]
  before_filter :authenticate_user!, :only => :user  # This is Devise's authentication
  #before_filter :store_location
  
  layout :layout_by_resource


  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied. You are not authorized to access the requested page."
    redirect_to root_path and return
  end
 
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end 

  #def after_sign_in_path_for(resource_or_scope)
  #  stored_location_for(resource_or_scope) ||
  #    if resource_or_scope == :admin or resource_or_scope.kind_of?(Admin)
  #      if super_admin?
  #         businesses_path
  #      elsif current_admin.is_investor?
  #        graph_report_path("monthly")
  #      elsif current_admin.is_operator?
  #        new_verification_path
  #      elsif current_admin.businesses.empty?
  #        new_business_path
  #      elsif current_admin.businesses.size == 1
  #        session[:business_id] = current_admin.businesses.first.id
  #        dashboard_path
  #      else
  #        businesses_path #select your business first.
  #      end
  #    elsif resource_or_scope == :affiliate || resource_or_scope.kind_of?(Affiliate)
  #      affiliate_dashboard_path
  #    elsif (resource_or_scope == :user || resource_or_scope.kind_of?(User)) && request.format == :iframe
  #      iframe_path
  #    elsif resource_or_scope == :user || resource_or_scope.kind_of?(User)
  #      me_path
  #    else
  #      signed_in_root_path(resource_or_scope)
  #    end
  #end
  def access_denied!
    render "errors/access_denied", layout: "errors", status: 404
  end
  def render_500
    render "errors/someting_went_wrong", layout: "errors", status: 500
  end
  def render_403
    head :forbidden
  end
  def not_found
    render_404
  end
  def render_404
    respond_to do |format|
      format.html do
        #render file: Rails.root.join("public", "404"), layout: false, status: "404"
        render "errors/page_not_found", layout: "errors", status: 404
      end
      format.any { head :not_found }
    end
  end
  def after_sign_in_path_for(resource)
    if resource.super_admin?
      users_path
    elsif resource.traveler?
      travelers_path
    elsif resource.agent?
      agents_path
    else
      root_path  
    end
  end
  def layout_by_resource
   #raise current_user.super_admin.inspect
    if devise_controller? && resource_name == :user && action_name == 'new'
      if user_signed_in?
        # to get the customers/edit looking right
        if current_user.super_admin?
          "application"
        elsif current_user.agent?
          "dashboard_agent"
        elsif current_user.traveler?
          "dashboard_traveler"
        else
          "application"
        end 
      else
        "login"
      end
    else
      if user_signed_in?
          if current_user.super_admin?
            "application"
          elsif current_user.agent?
            "dashboard_agent"
          elsif current_user.traveler?
            "dashboard_traveler"
          else
            "application"
          end 
      else
        "login"    
      end    
    end
  end

  def super_admin?
    current_user.role.name == "Super Admin"
  end
  def traveler?
    current_user.role.name == "Traveler"
  end
  def agent?
    current_user.role.name == "Agent"
  end

  protected
 
  #derive the model name from the controller. egs UsersController will return User
  def self.permission
    return name = self.name.gsub('Controller','').singularize.split('::').last.constantize.name rescue nil
  end
 
  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
 
  #load the permissions for the current user so that UI can be manipulated
  def load_permissions
    @current_permissions = current_user.role.permissions.collect{|i| [i.subject_class, i.action]}
  end
end
