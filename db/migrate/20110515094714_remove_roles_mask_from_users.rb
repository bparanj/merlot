class RemoveRolesMaskFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :roles_mask
  end

  def self.down
  end
end
