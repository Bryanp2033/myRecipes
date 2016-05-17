class CreateReviewsToRecipes < ActiveRecord::Migration
  def change
    create_table :reviews_to_recipes do |t|
      t.text :body
      t.references :chef_id, index: true, foreign_key: true
      t.references :recipe_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
