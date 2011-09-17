class Article < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true
    
  def self.two_weeks_count
    count('id', :conditions => ["created_at > ?", 2.weeks.ago])
  end  

  def self.older_than_two_weeks(p)
     results = find(:all, 
                    :conditions => ["created_at < ?", 2.weeks.ago], 
                    :order => "published_on desc")

    Kaminari.paginate_array(results).page(p).per(5)
  end
  
  def self.ten_recent
    find(:all, 
         :order => "published_on desc", :limit => 10)    
  end
end