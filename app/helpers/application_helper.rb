module ApplicationHelper
  include TweetButton
  
  def is_active?(page_name)
      # logger.info("Page name #{page_name}")
      # logger.info("Controller name #{params[:controller]}")
     servlet = params[:controller]
     if page_name == "users/edit" && servlet == "registrations"
       "current"
     elsif servlet == page_name
       "current" 
     elsif page_name == "admin/edit" && servlet == "devise/registrations"
       "current"
     elsif page_name == "submissions" && servlet == "submissions"
       "current"
     end
  end
  
  def left_arrow(text)
    raw("&larr #{text}")
  end
  
end
