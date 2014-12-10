class ProductsController < ApplicationController
  def index
    @product = Product.order('id').page(params[:page]).per(6)
    @category = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @category = Category.all
  end

  def show_all
    @product = Product.all
    @category = Category.all
  end

  def search_results
    # we will do a search here
    @category = Category.all
    if keyword_present
      wildcard_keywords = '%' + params[:search_keywords] + '%'
      @product = check_search(wildcard_keywords)
    end
  end

  def keyword_present
    params[:search_keywords].present?
  end

  def category_selected
    params[:category].present?
  end

  def check_search(wildcard_keywords)
    if category_selected
      find_products_by_category(wildcard_keywords)
    else
      find_products(wildcard_keywords)
    end
  end

  def find_products_by_category(wildcard_keywords)
    @product = Category.find_by_id(params[:category])
               .products.where('name LIKE ?', wildcard_keywords)
               .page(params[:page]).per(6)
  end

  def find_products(wildcard_keywords)
    @product = Product.where('name LIKE ?', wildcard_keywords)
                .page(params[:page]).per(6)
  end
end
