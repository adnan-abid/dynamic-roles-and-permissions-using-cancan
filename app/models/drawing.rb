class Drawing < ApplicationRecord
	#attr_accessor :sheet_number, :part_id
  	belongs_to :part
end
