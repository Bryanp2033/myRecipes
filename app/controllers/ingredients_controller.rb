class IngredientsController < ApplicationController
	before_action :require_user, expect: [:show]

	def new
		@ingredient = Ingredient.new
	end

	def create
		@ingredient = Ingredient.new(ingredient_params)
		if @ingredient.save
			flash[:success] = "Your ingredient was saved"
			redirect_to recipes_path
		else
			render 'new'
		end
	end

	def show
		@ingredient = Ingredient.find(params[:id])
		@recipes = @ingredient.recipe.paginate(:page => params[:page], per_page => 4)
	end


	private

	def ingredient_params
		params.require(:ingredient).permit(:name)
	end

end