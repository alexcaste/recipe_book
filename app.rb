require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @categories = Category.all
  erb(:index)
end

post '/' do
  Category.create({categ_name: params.fetch("category")})
  redirect '/'
end

delete '/category/:id' do
  id = params.fetch("id").to_i
  @category = Category.find(id)
  @category.delete
  redirect '/'
end

get '/recipes/:categ_name/:id' do
  @category = Category.find(params.fetch('id'))
  @recipes = @category.recipes
  @ingredient = nil
  erb(:recipes)
end

get '/recipes' do
  @recipes = Recipe.all
  @category = nil
  @ingredient = nil
  erb(:recipes)
end

get '/recipes/:ing_name/:id' do
  @category = nil
  @recipes = @ingredient.recipes
  @ingredient = Ingredient.find(params.fetch('id'))
  erb(:recipes)
end

get '/recipe_form' do
  @categories = Category.all
  @ingredients = Ingredient.all
  erb(:recipe_form)
end

post '/recipe_form' do
  ingredients =[]
  rec_name = params.fetch('rec_name')
  rec_inst = params.fetch('instructions')
  category = (params.fetch('category').to_i)
  if category == 0
    recipe = Recipe.create(rec_name: rec_name, rec_inst: rec_inst)
  else
    category = Category.find(category)
    recipe = category.recipes.create(rec_name: rec_name, rec_inst: rec_inst)
  end
  if params[:ingredient_ids]
    ingredients = params.fetch("ingredient_ids")
    ingredients.each do |ing|
      if ing.to_i != 0
        ingredient = Ingredient.find(ing.to_i)
        Amount.create({recipe_id: recipe.id, ingredient_id: ing})
      end
    end
  else
    ingredients = []
  end
  redirect ('/recipe/'.concat(recipe.id.to_s))
end




get '/ingredients' do
  @ingredients = Ingredient.all
  @recipes = nil
  erb(:ingredients)
end

get '/ingredients/:id' do
  @ingredient = Ingredient.find(params.fetch('id'))
  @ingredients = []
  @recipes = @ingredient.recipes
  erb(:ingredients)
end

delete '/ingredient/:id' do
  id = params.fetch("id").to_i
  @ingredient = Ingredient.find(id)
  @ingredient.delete
  redirect '/ingredients'
end

post '/ingredients' do
  Ingredient.create({ing_name: params.fetch("ingredient")})
  redirect '/ingredients'
end

get '/recipe/:id' do
  @recipe = Recipe.find(params.fetch('id'))
  @ingredients = @recipe.ingredients
  @all_ing = Ingredient.all
  @ing_amount = Amount.ing_amounts(@recipe.id)

  erb(:recipe)
end

delete '/recipe/:id' do
  id = params.fetch("id").to_i
  @recipe = Recipe.find(id)
  @recipe.delete
  redirect '/recipes'
end
