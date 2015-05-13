class AddTables < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:rec_name, :string)
      t.column(:rec_inst, :string)
    end
    create_table(:ingredients) do |t|
      t.column(:ing_name, :string)
    end
    create_table(:categories) do |t|
      t.column(:categ_name, :string)
    end
    create_table(:amounts) do |t|
      t.column(:measure, :string)
      t.column(:recipe_id, :int)
      t.column(:ingredient_id, :int)
    end
  end
end
