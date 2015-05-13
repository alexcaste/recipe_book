require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
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

get '/ingredients' do
  @ingredients = Ingredient.all
  @recipes = nil
  erb(:ingredients)
end

get '/ingredients/:ing_name/:id' do
  @ingredient = Ingredient.find(params.fetch('id'))
  @ingredients = []
  @recipes = @ingredient.recipes
  erb(:ingredients)
end
