class OrdersController < ApplicationController

  def add_to_cart
    (session[:cart] ||= []) << params[:id]
    redirect_to :back
  end

  def remove_from_cart
    (session[:cart] ||= []).delete_at(session[:cart].index(params[:id]) ||
    session[:cart].length)

    is_cart_empty
  end

  def view_cart
    @category = Category.all
  end

  def is_cart_empty
    if session[:cart].empty?
      session.delete(:cart)
      redirect_to :root
    else
      redirect_to :back
    end
  end

end
