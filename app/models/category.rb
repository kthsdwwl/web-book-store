class Category < ActiveRecord::Base
  attr_accessible :name, :parent_category_id
  
  has_many :products
  belongs_to :parent_category
end
