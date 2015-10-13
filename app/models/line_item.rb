class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  
  attr_accessible :cart_id, :product_id, :quantity, :product
  
  validates :quantity, numericality: {greater_than_or_equal_to: 1}
  
  def total_price
    product.price * quantity
  end
end
