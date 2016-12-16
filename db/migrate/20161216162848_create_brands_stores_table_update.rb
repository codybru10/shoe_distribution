class CreateBrandsStoresTableUpdate < ActiveRecord::Migration[5.0]
  def change
    create_table(:brands_recipes) do |b|
      b.column(:brand_id, :integer)
      b.column(:recipe_id, :integer)

      b.timestamps()
    end
  end
end
