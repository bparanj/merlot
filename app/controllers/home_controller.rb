class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => :token

  def index
    @articles = Article.ten_recent
  end

  def token
  end
end