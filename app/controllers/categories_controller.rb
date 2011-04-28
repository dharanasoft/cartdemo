class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render :index, :layout=>!request.xhr?
  end
  def new
    @categories = Category.all
    @category = Category.new
    render :partial=>"form" if request.xhr?
  end
  def create
    @category = Category.new(params[:category])
    @categories = Category.all
    if(@category.save)
      flash[:notice] = "Category saved successfully"
      redirect_to categories_path if !request.xhr?
      render Category.all, :layout=>!!request.xhr? if request.xhr?
    else
      status = !!request.xhr? ? 500 : 200
      puts "request xhr is #{request.xhr?} and the status is #{status}"
      render :action=>:new, :layout=>!request.xhr?, :status=>status
    end
  end
end
