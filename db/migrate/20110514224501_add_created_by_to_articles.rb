class AddCreatedByToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :created_by, :string
  end

  def self.down
    remove_column :articles, :created_by
  end
end
