class LoginsController < ApplicationController
	def new

	end

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

	def destroy
		session[:chef] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end
end