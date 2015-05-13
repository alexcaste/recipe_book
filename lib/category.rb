class Category < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  validates(:categ_name, {:presence => true, :length => {:maximum => 50}})
end
