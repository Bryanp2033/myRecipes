class ChefsController < ApplicationController
	before_action :set_chef, only: [:edit, :update, :show]
	before_action :require_same_user, only: [:edit, :update]

	#index with paginatation feature, allows to organize the collection better.
	def index
		@chefs = Chef.paginate(page: params[:page], per_page: 3)
	end

	#chefs variable equals to a new chef
	def new
		@chefs = Chef.new
	end

	#chefs creates the entry based on private params method.
	def create
		@chefs = Chef.new(chefs_params)
		if @chefs.save
			flash[:success] = "Your account was created successfully"
			session[:chef] = @chefs.id
			redirect_to recipes_path
		else
			render 'new'
		end
	end

	def edit
	end

	#updates if only the params are passed
	def update
		if @chefs.update(chefs_params)
			flash[:success] = "Your changes to the account was saved successfully"
			redirect_to chef_path(@chefs)
		else
			render 'edit'
		end
	end

	#shows the recipes made by the chef
	def show
		@recipes = @chefs.recipes.paginate(page: params[:page], per_page: 3)
	end


	private

	#params a method parameter that takes variavle number of aruguments/ works for HTTP requests.
	def chefs_params
		params.require(:chef).permit(:name, :email, :password)
	end


	#this private method checks if the current user of the session is the same as the chef that being edited.
	def require_same_user
		if current_user = @chef
			flash[:danger] = "You can only edit your own profile"
			redirect_to root_path
		end
	end

	#a method used in before_action in order to keep the code DRY
	def set_chef
		@chefs = Chef.find(params[:id])
	end
end
