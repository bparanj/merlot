class Category < ActiveRecord::Base
  attr_accessible :name
  
  has_friendly_id :name, :use_slug => true
  
  has_many :articles
  
  def self.alphabetally_sorted
    find(:all, :order => "name")
  end
  
  def self.list_for_navigation
    result = []
    list =  find(:all, :order => "name")
    list.each do |category|
      result << category if category.articles.count > 0
    end
    result
  end
end
