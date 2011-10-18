class CategoriesController < ApplicationController
  before_filter :verify_is_admin, :except => [:show, :index]
   
  def index
    if admin_signed_in?
      @categories = Category.alphabetally_sorted
    else
      @categories = Category.list_for_navigation
    end
  end
    
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Successfully created category."
      redirect_to categories_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Successfully updated category."
      redirect_to categories_path
    else
      render :action => 'edit'
    end
  end
  
  def show
    @category = Category.find(params[:id])    
    @articles = @category.articles
    set_meta_tags :title => 'Credit Cards Logic',
                   :description => 'Credit Cards Related Articles.',
                   :noindex => true,
                   :nofollow => true    					     
  end
end