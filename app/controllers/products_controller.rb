class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @products = @category.products
    render(:partial=>"all_products", :layout=>false) if request.xhr?
  end
  def new
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @product = @category.products.build
    render :partial=>"form"
  end
  def create
    @category = Category.find(params[:category_id])
    @product = Product.new(params[:product])
    @product.category = @category
    if(@product.save)
      flash[:notice] = "Product added successfully"
      redirect_to @product if !request.xhr?
      redirect_to category_products_path(@category) if request.xhr?
    else
      render :action=>:new
    end
  end
  def show
    @categories = Category.all
    @product = Product.find(params[:id])
    @category = @product.category
  end
end
