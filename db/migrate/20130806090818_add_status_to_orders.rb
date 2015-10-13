class AddStatusToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :integer, default: 0
  end
  
  def down
    remove_column :orders, :status
  end
end
