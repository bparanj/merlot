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
                  :description => 'Free credit help based on your goals.',
                  :noindex => true,
                  :nofollow => true    					     
  end
  
  def feed
    @title = "Credit Cards Logic Atom Feed"
    @articles = Article.limit(25).order("updated_at desc")
    @updated = @articles.first.updated_at unless @articles.empty?

    respond_to do |format|
      if request.env['HTTP_USER_AGENT'] =~ /feedburner/i
        format.atom { render :layout => false }
        format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }        
      else
        format.atom { redirect_to 'http://feeds.feedburner.com/CreditCardsLogicAtomFeed' }
        format.rss { redirect_to 'http://feeds.feedburner.com/CreditCardsLogicAtomFeed', :status => :moved_permanently }        
      end
    end
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
