require("bundler/setup")
Bundler.require(:default)

get('/') do
  @categories = Category.all
  erb(:index)
end
