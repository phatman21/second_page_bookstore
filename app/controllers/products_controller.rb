class ProductsController < ApplicationController
  def index
    @product = Product.order('id').page(params[:page]).per(6)
    @category = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @category = Category.all
  end

  def search_results
    # we will do a search here
    wildcard_keywords = '%' + params[:search_keywords] + '%'
    @product = Product.where('name LIKE ?', wildcard_keywords)
               .page(params[:page]).per(6)
    @category = Category.all
  end
  # view app/views/search_results.html.slim
end
