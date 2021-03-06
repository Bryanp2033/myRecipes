class Style < ActiveRecord::Base

	#model relationships and valiadations
	validates :name, presence: true, length: {minimum: 2, maximum: 25 }
	has_many :recipe_style
	has_many :recipes, through: :recipe_style
end 


