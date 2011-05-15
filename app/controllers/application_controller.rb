class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :layout
  layout :layout_by_resource

  
  protected
  
  def layout_by_resource
    if admin_signed_in?
      "admin_layout"
    else
      "application"
    end
  end

end
