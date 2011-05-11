class AdminsController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
  end
  
  # Sign in as another user if you are an admin.
  # TODO: Create a view that has a link to become action for admin only
  def become
    return unless current_user.is_an_admin?
    sign_in(:user, User.find(params[:id]))
    redirect_to root_path
  end
  
end
