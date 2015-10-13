class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :product_id
  
  validates :content, :user_id, :product_id, presence:true
  
  belongs_to :product
  belongs_to :user
end
