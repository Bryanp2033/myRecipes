class Review < ActiveRecord::Base
	belongs_to :chef
	belongs_to :recipe
	default_scope { order('updated_at ASC')}
end
