class RecipesController < ApplicationController
	before_action :set_recipe_find, only: [:edit, :update, :show, :like]
	before_action :require_user_like, only: [:like]
	before_action :admin_to_recipes, only: [:destroy]
	before_action :require_same_user_to_recipes, expect: [:show, :index, :like]
	before_action :require_same_user_to_recipes, only: [:edit, :update]


	def index
		@recipes = Recipe.paginate(page: params[:page], per_page: 4)
	end

	def show
		
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.chef = current_user

		if @recipe.save
			flash[:success] = "Your recipe was created successfully!"
			redirect_to recipes_path
		else
			render :new

		end
	end

	def edit
		
	end

	def update
		
		if @recipe.update(recipe_params)
			flash[:success] = "Your recipe was updated successfully!"
			redirect_to recipes_path
		else
			render :edit
		end
	end

	def new
		@recipe = Recipe.new
	end

	def like
		like = Like.create(like: params[:like], chef_id: current_user, recipe_id: @recipe)
		if like.valid?
			flash[:success] = "Your selection was successful"
			redirect_to :back
		else
			flash[:danger] = "You can only like/dislike a recipe once"
			redirect_to :back
		end
	end

	def destroy
		Recipe.find(params[:id]).destroy
		flash[:success] = "The Recipe was deleted successfully"
		redirect_to recipes_path
	end

		private

			def recipe_params
				params.require(:recipe).permit(:name, :summary, :description, :picure, style_ids: [], ingredient_ids: [])
			end

			def require_same_user_to_recipes
				if current_user != @recipe.chef and !current_user.admin?
					flash[:danger] = "You can only edit/update your own recipes"
					redirect_to root_path
				end
			end

			def set_recipe_find
				@recipe = Recipe.find(params[:id])	
			end

			def admin_to_recipes
				redirect_to recipes_path unless current_user.admin?
			end

			def require_user_like
    			if !logged_in?
      			flash[:danger] = "You must be logged in"
     			redirect_to :back
    		end
  end
end