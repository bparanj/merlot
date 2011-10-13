class Category < ActiveRecord::Base
  attr_accessible :name
  
  has_friendly_id :name, :use_slug => true
  
  has_many :articles
  
  def self.alphabetally_sorted
    find(:all, :order => "name")
  end
end
