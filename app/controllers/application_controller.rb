class ApplicationController < ActionController::Base
  protect_from_forgery
  # helper :layout
  layout :layout_by_resource
  before_filter :load_layout_customization
  
  protected
  
  def layout_by_resource
    if admin_signed_in?
      "admin_layout"
    else
      "application"
    end
  end

  def load_layout_customization
    @left_navigation = false
    @right_navigation = false
  end
end
