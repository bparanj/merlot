class CategoriesController < ApplicationController
  before_filter :verify_is_admin, :except => [:show, :index]
   
  def index
    @categories = Category.all
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
  end
end