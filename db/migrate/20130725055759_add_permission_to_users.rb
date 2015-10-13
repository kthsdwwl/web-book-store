class AddPermissionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :permission, :integer, default: 1
  end
end
