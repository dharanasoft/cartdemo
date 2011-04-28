class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def new
    @categories = Category.all
    @category = Category.new
  end
  def create
    @category = Category.new(params[:category])
    if(@category.save)
      flash[:notice] = "Category saved successfully"
      redirect_to categories_path
    else
      render :action=>:new
    end
  end
end
