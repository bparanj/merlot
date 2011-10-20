class ArticlesController < ApplicationController

  before_filter :verify_is_admin, :only => [:edit, :update, :destroy] 
  uses_tiny_mce

  def index
    @articles = Article.order("created_at desc").page(params[:page]).per(100)
    # @articles = Article.older_than_two_weeks(params[:page])
  end

  def show
    @article = Article.find(params[:id])
    @fb_like_url = CGI::escape(request.url)
  end

  def new
    @article = Article.new
    today = Date.today
    @article.published_on = "#{today.month}/#{today.day}/#{today.year}"
    @categories = Category.alphabetally_sorted
  end

  def edit
    @article = Article.find(params[:id])
    @categories = Category.alphabetally_sorted
  end

  def create
    @article = Article.new(params[:article])
    set_created_by(@article)
    
    if @article.save
      redirect_to(new_article_path, :notice => 'Article was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update_attributes(params[:article])
      redirect_to(@article, :notice => 'Article was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    # TODO: Mark article as archived
    # @article.destroy
    redirect_to(articles_url)
  end
  
  def related
    @articles = Article.related(CGI.unescape(params[:tag]))
    @show_related = true
    set_meta_tags :title => 'Credit Cards Logic',
                  :description => 'Credit Cards Related Articles.',
                  :noindex => true,
                  :nofollow => true    					     
  end
  
  private
  
  def set_created_by(article)
    if current_user
      article.created_by = current_user.email
    else
      article.created_by = "Guest"
    end
  end
end
