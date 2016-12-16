class CreateBrandsStoresTableFixName < ActiveRecord::Migration[5.0]
  def change
    remove_column(:brands_recipes, :recipe_id, :integer)
    add_column(:brands_recipes, :store_id, :integer)
  end
end
