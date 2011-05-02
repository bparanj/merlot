class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |deny|
    flash[:error] = "Page not found!"
    redirect_to root_url
  end
  
  def layout_by_resource
    if devise_controller? && resource_name == :admin
      "admin_layout"
    else
      "application"
    end
  end

end
