class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:stores) do |s|
      s.column(:name, :string)

      s.timestamps()
    end
    create_table(:brands) do |b|
      b.column(:name, :string)

      b.timestamps()
    end
  end
end
