class DropBrandsRecipesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table(:brands_recipes)

    create_table(:brands_stores) do |b|
      b.column(:brand_id, :integer)
      b.column(:store_id, :integer)

      b.timestamps()
    end
  end
end
