class RecipeStyle < ActiveRecord::Base

	#model relationships
	belongs_to :recipe
	belongs_to :style
end