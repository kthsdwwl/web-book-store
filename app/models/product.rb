class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence:true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'must be a URL for GIF, JPG or PNG image.' 
  }
  
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :comments, dependent: :destroy
  before_destroy :ensure_not_referenced_by_any_line_item
  belongs_to :category
  
  accepts_nested_attributes_for :category
  
  attr_accessible :title, :description, :image_url, :price, :category_id, :like_num
  
  def self.search(search)
    if search
      where('title like ?', "%#{search}%")
    else
      all
    end
  end
  
  private
  
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
