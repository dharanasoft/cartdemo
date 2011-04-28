class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @products = @category.products
  end
end
