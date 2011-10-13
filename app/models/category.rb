class Category < ActiveRecord::Base
  attr_accessible :name
  
  has_many :articles
  
  def self.alphabetally_sorted
    find(:all, :order => "name")
  end
end
