class Amount <ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe
  define_singleton_method(:ing_amounts) do |id|
    amounts = []
    all_amounts = Amount.all
    all_amounts.each do |amount|
      if amount.recipe_id == id
        ingredient = Ingredient.find(amount.ingredient_id)
        amounts.push([ingredient.id, amount.measure])
      end
    end
    amounts
  end

end
