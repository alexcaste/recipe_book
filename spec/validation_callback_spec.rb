require 'spec_helper'

describe('#category_validation') do
  it("returns false if the category name is unfilled") do
    crappy_food = Category.create({categ_name: "Crappy Food"})
    crappier_food = Category.create({categ_name: "Haggis".*(10)})
    the_crappiest_food = Category.create({})
    expect(crappy_food.save).to(eq(true))
    expect(crappier_food.save).to(eq(false))
    expect(the_crappiest_food.save).to(eq(false))
  end
end

describe('#recipe_validation') do
  it("returns false if the recipe name is unfilled") do
    cheeseburger = Recipe.create({rec_name: "cheeseburger"})
    beer = Recipe.create({rec_name: "beer".*(14)})
    french_fries = Recipe.create({rec_name: ""})
    expect(cheeseburger.save).to(eq(true))
    expect(beer.save).to(eq(false))
    expect(french_fries.save).to(eq(false))
  end
end

describe('#ingredient_validation') do
  it("returns false if the recipe name is unfilled") do
    beef = Ingredient.create({ing_name: "beef"})
    oatmeal = Ingredient.create({ing_name: "oatmeal".*(10)})
    cow_tongue = Ingredient.create({ing_name: ""})
    expect(beef.save).to(eq(true))
    expect(oatmeal.save).to(eq(false))
    expect(cow_tongue.save).to(eq(false))
  end
end
