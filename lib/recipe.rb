class Recipe <ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :amounts
  has_many :ingredients, through: :amounts
  validates(:rec_name, {:presence => true, :length => {:maximum => 50}})
end
