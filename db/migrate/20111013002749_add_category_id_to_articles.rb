class AddCategoryIdToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :category_id, :integer
  end

  def self.down
  end
end
