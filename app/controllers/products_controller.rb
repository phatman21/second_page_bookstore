class ProductsController < ApplicationController
  def index
    @product = Product.take(6)
    @category = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @category = Category.all
  end

  def show_category
    @product = Product.find(params[:category.name])
  end

  def search_results
    # we will do a search here
    wildcard_keywords = '%' + params[:search_keywords] + '%'
    @product = Product.where('name LIKE ?', wildcard_keywords)
    @category = Category.all
  end
  # view app/views/search_results.html.slim
end
