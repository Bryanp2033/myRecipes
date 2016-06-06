class RecipesController < ApplicationController
	before_action :set_recipe_find, only: [:edit, :update, :show, :like]
	before_action :require_user_like, only: [:like]
	before_action :admin_to_recipes, only: [:destroy]
	before_action :require_same_user_to_recipes, expect: [:show, :index, :like]
	before_action :require_same_user_to_recipes, only: [:edit, :update]

	#basic crud commands, refer to chefs_controller for further details
	def index
		@recipes = Recipe.paginate(page: params[:page], per_page: 4)
	end

	def show
		@review = Review.new(params[:body])
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


	# a like feature mainly used the recipes#index and recipes#show
	def like
		like = Like.create(like: params[:like], chef: current_user, recipe: @recipe)
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

			#this error will flash if the current user does not equal the owner of the current recipe and if they're not an admin.
			def require_same_user_to_recipes
				if current_user != @recipe.chef and !current_user.admin?
					flash[:danger] = "You can only edit/update your own recipes"
					redirect_to root_path
				end
			end

			#before action method to keep the code DRY
			def set_recipe_find
				@recipe = Recipe.find(params[:id])	
			end

			#redirects to recipes#index if the current user isn't an admin
			def admin_to_recipes
				redirect_to recipes_path unless current_user.admin?
			end

			#if not loggin in, then this error will flash
			def require_user_like
				if !logged_in?
					flash[:danger] = "You must be logged in"
					redirect_to :back
				end
			end
		end