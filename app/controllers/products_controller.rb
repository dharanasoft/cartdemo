class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @products = @category.products
  end
  def new
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @product = @category.products.build
  end
  def create
    @category = Category.find(params[:category_id])
    @product = Product.new(params[:product])
    if(@product.save)
      flash[:notice] = "Product added successfully"
      redirect_to @product
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
