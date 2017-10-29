class Review < ActiveRecord::Base

	#model relationships
	belongs_to :chef
	belongs_to :recipe

	#sorts the reviews collection under the recipes#show in ascending order
	default_scope { order('updated_at ASC')}
end
