class ReviewsController < ApplicationController

	def create

		@recipe = Recipe.find(params[:recipe_id])
		@review = Review.new(reviews_params)
		@review.chef = current_user
		@new_review = Review.new

	if @review.save
		respond_to do |format|
				format.html
				format.js
			end
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
