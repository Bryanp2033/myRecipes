class StylesController < ApplicationController
	before_action :require_user, expect: [:show]

	#basic crud action, refer to chefs_controller for further details
	def new
		@style = Style.new
	end

	def create
		@style = Style.new(styles_params)

		if @style.save
			flash[:success] = "Your style was saved"
			redirect_to recipes_path
		else
			render 'new'
		end
	end

	def show
		@style = Style.find(params[:id])
		@recipes = @style.recipes.paginate(page: params[:page], per_page: 4)
	end


	private

	def styles_params
		params.require(:style).permit(:name)
	end

end