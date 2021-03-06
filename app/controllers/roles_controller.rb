class RolesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_super_admin?

  def index
    @roles = Role.all{|i| i.name != "Super Admin"}
  end
  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role }
    end
  end
  def create
    @role = Role.new(params.require(:role).permit(:name))

    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Role was successfully created.' }
        format.json { render json: @role, status: :created, location: @role }
      else
        format.html { render action: "new" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    @role = Role.find(params[:id])
    @permissions = @role.permissions
  end

  def edit
    @role = Role.find(params[:id])
    @permissions = Permission.all{|i| ["Part"].include? i.subject_class}.compact
    @role_permissions = @role.permissions.collect{|p| p.id}
  end

  def update
    @role = Role.find(params[:id])
    @role.permissions = []
    @role.set_permissions(params[:permissions]) if params[:permissions]
    if @role.save
      redirect_to roles_path and return
    end
    @permissions = Permission.all{|i| ["Part"].include? i.subject_class}.compact
    render 'edit'
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :no_content }
    end
  end
  
  private

  def is_super_admin?
    redirect_to root_path and return unless current_user.super_admin?
  end
end
