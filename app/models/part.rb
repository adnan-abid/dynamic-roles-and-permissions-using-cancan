class Part < ApplicationRecord
	#attr_accessor :name
	#attr_accessor :name
  	has_many :drawings
  	has_many :plans
end
