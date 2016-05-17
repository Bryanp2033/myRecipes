class ReviewsController < ApplicationController

	def create

		@recipe = Recipe.find(params[:id])
		@review = Review.new(reviews_params)
		@review.chef = current_user
		@new_review = Review.new

		if @review.save 
			flash[:success] = "Your review was saved"
			redirect_to recipes_path
		else
			flash[:danger] = "Your review wasn't saved, Please try again"
			redirect_to :back

	end
end

def new
	@review = Review.new
end



private

def reviews_params
	params.require(:review).permit(:body)
end

end
