require 'rake' 
load File.join(Rails.root, 'lib', 'tasks', 'permission.rake')
class PermissionsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_filter :load_permissions
  Rails.application.eager_load!

  def index
    @permissions = Permission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @permissions }
    end
  end

  def show
    @permission = Permission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @permission }
    end
  end

  def new
    @permission = Permission.new

     @models = ActiveRecord::Base.connection.tables
     @model_namesss = ApplicationController.descendants;

      @modelName = model_name
      
      @table_names =  ActiveRecord::Base.connection.tables
        @model_names = Array.new
        @model_names.each do |table_to_model|
          @model_names = @model_names.insert(@model_names.length,table_to_model.camelize.singularize) unless table_to_model.blank?
        end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @permission }
    end
  end

  def edit
    @permission = Permission.find(params[:id])
  end

  def create
    respond_to do |format|
      if @permission.save
        sync
        format.html { redirect_to permissions_path, notice: 'Permission was successfully created.' }
        format.json { render json: @permission, status: :created, location: @permission }
      else
          format.html { render action: "new" }
          format.json { render json: @permission.errors, status: :unprocessable_entity }
      end    
    end
  end

  def update
    @permission = Permission.find(params[:id])

    respond_to do |permission|
      if @permission.update_attributes(params[:permission])
        format.html { redirect_to @permission, notice: 'Permission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @permission = Permission.find(params[:id])
    @permission.destroy

    respond_to do |format|
      format.html { redirect_to permissions_url }
      format.json { head :no_content }
    end
  end

  

  private
      def permission_params
        #params.require(:permission).permit(:name)
        params.require(:permission).permit(:subject_class).permit(:action).permit(:name).permit(:description)
      end
      def model_name
        params[:controller].sub("Controller", "").underscore.split('/').last.singularize
      end
      def sync
        %x(bundle exec rake permissions:permissions)
      end

end