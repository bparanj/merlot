class AddOutlineToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :outline, :boolean, :default => 0    
  end

  def self.down
  end
end
