class Category < ActiveRecord::Base
  attr_accessible :name
  
  def self.alphabetally_sorted
    find(:all, :order => "name")
  end
end
