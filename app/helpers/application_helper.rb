module ApplicationHelper
  
  def is_active?(page_name)
    # logger.info("lllllllllllll #{page_name}")
    # logger.info("cccccccccccccc #{params[:controller]}")
    "current" if params[:controller] == page_name
  end
  
  def left_arrow(text)
    raw("&larr #{text}")
  end
  
end
