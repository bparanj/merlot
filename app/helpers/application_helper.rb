module ApplicationHelper
  
  def is_active?(page_name)
      # logger.info("lllllllllllll #{page_name}")
      # logger.info("cccccccccccccc #{params[:controller]}")
     servlet = params[:controller]
     if page_name == "users/edit" && servlet == "registrations"
       "current"
     elsif servlet == page_name
       "current" 
     elsif page_name == "admin/edit" && servlet == "devise/registrations"
       "current"
     end
  end
  
  def left_arrow(text)
    raw("&larr #{text}")
  end
  
end
