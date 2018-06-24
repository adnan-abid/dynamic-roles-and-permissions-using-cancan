class TravelerPlan < ApplicationRecord
#attr_accessible :plan_name, :plan_description
	#attr_writer :current_step
#validates_presence_of :plan_name, :if => lambda { |o| o.current_step == "plan" }
#validates_presence_of :plan_description, :if => lambda { |o| o.current_step == "description" }

validates :plan_name, presence: true, if: :step1?
validates :plan_short_description, presence: true, if: :step2?
validates :is_active, presence: true, if: :step3?

include MultiStepModel

  def self.total_steps
    3
  end
end
