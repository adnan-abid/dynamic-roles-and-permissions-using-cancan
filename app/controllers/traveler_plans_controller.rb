class TravelerPlansController < ApplicationController
  before_action :load_traveler_plan
  def index
   
  end

  def show
  end

  def new
    #session[:traveler_plan_params] ||= {}
    #@traveler_plan = TravelerPlan.new(session[:traveler_plan_params])

    #raise session[:traveler_plan_step].inspect
    #@traveler_plan.current_step = session[:traveler_plan_step]
    
    @wizard = ModelWizard.new(TravelerPlan, session, params).start
    @traveler_plan = @wizard.object
  end
  
  def create
    @wizard = ModelWizard.new(TravelerPlan, session, params, traveler_plan_params).continue
    @traveler_plan = @wizard.object
    if @wizard.save
      redirect_to @traveler_plan, notice: "Product created!"
    else
      render :new
    end
  end
  #def create
  #  session[:traveler_plan_params].deep_merge!(params[:traveler_plan]) if c
  #  @traveler_plan = TravelerPlan.new(session[:traveler_plan_params])
  #  @traveler_plan.current_step = session[:traveler_plan_step]
  #  if @traveler_plan.valid?
  #    if params[:back_button]
  #      @traveler_plan.previous_step
  #    elsif @traveler_plan.last_step?
  #      @traveler_plan.save if @traveler_plan.all_valid?
  #    else
  #      @traveler_plan.next_step
  #    end
  #    session[:traveler_plan_step] = @traveler_plan.current_step
  #  end
  #  if @traveler_plan.new_record?
  #    render "new"
  #  else
  #    session[:traveler_plan_step] = session[:traveler_plan_params] = nil
  #    flash[:notice] = "Plan saved!"
  #    redirect_to @traveler_plan
  #  end
  #end



  def edit
    @wizard = ModelWizard.new(@traveler_plan, session, params).start
  end

  def update
    @wizard = ModelWizard.new(@traveler_plan, session, params, traveler_plan_params).continue
    if @wizard.save
      redirect_to @traveler_plan, notice: 'Plan updated.'
    else
      render :edit
    end
  end

  def destory
    @traveler_plan.destroy
    redirect_to traveler_plans_url
  end

  private
      #def traveler_plan_params
        #params.require(:part).permit(:name)
        #params.require(:traveler_plan).permit(:plan_name, :plan_description)
      #end


    def load_traveler_plan
      @traveler_plan = TravelerPlan.find_by(id: params[:id])
    end

    def traveler_plan_params
      return params unless params[:traveler_plan]

      params.require(:traveler_plan).permit(:current_step,
        :plan_name,
        :plan_description,
        :plan_short_description,
        :is_status,
        :is_deleted,
        :is_active
      )
    end    
end
