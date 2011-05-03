class ArticlesController < ApplicationController
  # TODO: #1 - Make edit save a new version with a string column in the article to indicate who edited it.
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])

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
    @article.destroy
    redirect_to(articles_url)
  end
end
