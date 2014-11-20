class ProductsController < ApplicationController
  def index
    @product = Product.take(6)
    @category = Category.all
  end
end
