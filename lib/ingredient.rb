class Ingredient < ActiveRecord::Base
  has_many :amounts
  has_many :recipes, through: :amounts
  validates(:ing_name, {:presence => true, :length => {:maximum => 50}})
end
