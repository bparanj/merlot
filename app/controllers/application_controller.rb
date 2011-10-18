class ApplicationController < ActionController::Base
  protect_from_forgery
  # helper :layout
  layout :layout_by_resource
  before_filter :load_layout_customization

  unless config.consider_all_requests_local
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
    rescue_from ActionController::UnknownController, :with => :render_not_found
    # customize these as much as you want, ie, different for every error or all the same
    rescue_from ActionController::UnknownAction, :with => :render_not_found
  end
  
  protected

  def layout_by_resource
    if ("devise/sessions" == params[:controller]) || admin_signed_in? 
      "admin_layout"
    else
      "application"
    end
  end

  def load_layout_customization
    @left_navigation = true
    @right_navigation = true if Rails.env.production?
  end
  
  def verify_is_admin
    redirect_to root_url unless admin_signed_in?
  end
  
  private

  def render_not_found(exception)
    ExceptionNotifier::Notifier.exception_notification(request.env, exception).deliver
    render :template => "/errors/fourzerofour.html.erb", :status => 404
  end

  def render_error(exception)
    # you can insert logic in here too to log errors
    # or get more error info and use different templates
    ExceptionNotifier::Notifier.exception_notification(request.env, exception).deliver
    
    render :template => "/errors/fivehundred.html.erb", :status => 500
  end
  
end
