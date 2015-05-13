require 'spec_helper'


describe('#recipes_categories_join') do
  it("verifies the association of one recipe with many categories") do
    crappy_foods = Category.create({categ_name: "Junk Food"})
    recipe1 = crappy_foods.recipes.create({rec_name: "cheeseburger"})
    recipe2 = crappy_foods.recipes.create({rec_name: "Hamburger"})
    expect(crappy_foods.recipes).to(eq([recipe1, recipe2]))
  end
end

describe('#rec_ing_ammount_join') do
  it("adds recipes and ingredients to amounts table with measurement") do
    cheeseburger = Recipe.create({rec_name:"cheeseburger"})
    beef = Ingredient.create({ing_name: "beef"})
    cheese_beef_amount = Amount.create({recipe_id: cheeseburger.id, ingredient_id: beef.id, measure: "1 patty"})
    expect(cheeseburger.amounts.where(ingredient_id: beef.id)).to(eq([cheese_beef_amount]))

  end
end
