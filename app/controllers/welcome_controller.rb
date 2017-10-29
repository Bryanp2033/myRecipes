class WelcomeController < ApplicationController

	#A method that directs the person if there're not logged in
	def home
		redirect_to recipes_path if logged_in?
	end
end
