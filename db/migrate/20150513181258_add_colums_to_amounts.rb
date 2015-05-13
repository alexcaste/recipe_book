class AddColumsToAmounts < ActiveRecord::Migration
  def change
    add_column(:amounts, :recipe_id, :int)
    add_column(:amounts, :ingredient_id, :int)
  end
end
