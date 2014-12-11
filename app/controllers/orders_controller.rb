class OrdersController < ApplicationController

  def add_to_cart
    (session[:cart] ||= []) << params[:id]
    redirect_to :back
  end

  def view_cart
    @category = Category.all
  end

end
