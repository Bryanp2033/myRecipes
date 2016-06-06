class Like < ActiveRecord::Base

	#model relationships
	belongs_to :chef
	belongs_to :recipe


	#like validation
	validates_uniqueness_of :chef, scope: :recipe
end
