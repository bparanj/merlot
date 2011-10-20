class Article < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true
  acts_as_taggable_on :tags
  
  belongs_to :category
        
  def self.two_weeks_count
    count('id', :conditions => ["created_at > ?", 2.weeks.ago])
  end  

  def self.older_than_two_weeks(p)
     results = find(:all, 
                    :conditions => ["created_at > ?", 2.weeks.ago], 
                    :order => "created_at desc")

    Kaminari.paginate_array(results).page(p).per(5)
  end
  
  def self.ten_recent
    find(:all, 
         :order => "created_at desc", :limit => 10)    
  end
  
  def self.related(tag)
    result = self.tagged_with([tag], :any => :true)
    result.size > 1 ? result : []
  end
  
end