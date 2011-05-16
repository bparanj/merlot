class Article < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true
    
  def self.two_weeks_count
    count('id', :conditions => ["created_at > ?", 2.weeks.ago])
  end  
end