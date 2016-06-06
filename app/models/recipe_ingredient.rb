class RecipeIngredient < ActiveRecord::Base

	#model relationships
	belongs_to :recipe
	belongs_to :ingredient
end