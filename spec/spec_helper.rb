ENV['RACK_ENV'] = 'test'


require("bundler/setup")
Bundler.require(:default, :test, :production)

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    Recipe.all.each do |recipe|
      recipe.destroy
    end
    Category.all.each do |c|
      c.destroy
    end
    Ingredient.all.each do |i|
      i.destroy
    end
    Amount.all.each do |a|
      a.destroy
    end
  end
end
