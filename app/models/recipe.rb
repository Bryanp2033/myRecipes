class Recipe < ActiveRecord::Base

	#model relationships and validations
	belongs_to :chef
	has_many :likes, dependent: :destroy
	has_many :recipe_styles, dependent: :destroy
	has_many :styles, through: :recipe_styles
	has_many :recipe_ingredients, dependent: :destroy
	has_many :ingredients, through: :recipe_ingredients
	has_many :reviews, dependent: :destroy
	validates :chef_id, presence: true
	validates :name, presence: true, length: { minimum: 5, maximum: 100}
	validates :summary, presence: true, length: {minimum: 10, maximum: 150}
	validates :description, presence: true, length: {minimum: 20, maximum: 500}
	mount_uploader :picture, PictureUploader
	validate :picture_size

	#sorts the the order of the recipes collection in descending order
	default_scope -> { order(updated_at: :desc) }

	#like thumbs up feature
	def thumbs_up_total
		self.likes.where(like: true).size
	end

	#like thumbs down feature
	def thumbs_down_total
		self.likes.where(like: false).size
	end

	#private method for images making sure the picture size doesn't go overboard
	private
	def picture_size
		if picture.size > 5.megabytes
			errors.add(:picture, "should be less than 5MB")
		end
	end
end
