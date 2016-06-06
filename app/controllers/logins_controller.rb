class LoginsController < ApplicationController

	def new
	end

	#verfies if the chef credentials are correct and if so creates the session for the chef
	def create
		chef = Chef.find_by(email: params[:email])
		if chef && chef.authenticate(params[:password])
			session[:chef] = chef.id
			flash[:success] = "You login successfully"
			redirect_to recipes_path
		else
			flash.now[:danger] = "Your email address or password does not match"
		end
	end

	#destroy the current chef session
	def destroy
		session[:chef] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end
end