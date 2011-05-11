class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |deny|
    flash[:error] = "Page not found!"
    redirect_to root_url
  end
  
  protected
  
  def layout_by_resource
    if admin_signed_in?
      logger.info("Layout resource used is admin_layout")
      "admin_layout"
    else
      "application"
    end
  end

end
