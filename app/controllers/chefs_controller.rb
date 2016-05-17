class ChefsController < ApplicationController
	before_action :set_chef, only: [:edit, :update, :show]
	before_action :require_same_user, only: [:edit, :update]

	def index
		@chefs = Chef.paginate(page: params[:page], per_page: 3)
	end

	def new
		@chefs = Chef.new
	end

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

	def update
		if @chefs.update(chefs_params)
			flash[:success] = "Your changes to the account was saved successfully"
			redirect_to chef_path(@chef)
		else
			render 'edit'
		end
	end

	def show
		@recipes = @chefs.recipes.paginate(page: params[:page], per_page: 3)
	end


	private

	def chefs_params
		params.require(:chef).permit(:name, :email, :password)
	end

	def require_same_user
		if current_user != @chef
			flash[:danger] = "You can only edit your own profile"
			redirect_to root_path
		end
	end

	def set_chef
		@chefs = Chef.find(params[:id])
	end
 end
