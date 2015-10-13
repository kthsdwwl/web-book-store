class AddLikeNumToProducts < ActiveRecord::Migration
  def change
    add_column :products, :like_num, :integer, default: 0
  end
end
