class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
    	t.string :ingredient_id, :recipe_id
    end
  end
end
