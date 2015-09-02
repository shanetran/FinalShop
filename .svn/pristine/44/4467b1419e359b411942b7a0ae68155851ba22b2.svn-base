class CartsController < ApplicationController
  def index
    @carts = session[:cart] ||= {}
  end

  def add
    id = params[:id]
    session[:cart] ||= {}
    if session[:cart]
      cart = session[:cart]
    end
    if cart[id]
    cart[id] += 1
    else
    cart[id] = 1
    end
    redirect_to carts_path
  end

  def update
    session[:cart] ||= {}
    quantity = params[:quantity]
    if session[:cart]
      cart = session[:cart]
    end
    quantity.each do |key, value|
      cart[key] = value.to_i
    end
    session[:cart] = cart
    redirect_to carts_path
  end

  def remove_item
    session[:cart] ||= {}
    id = params[:id]
    if session[:cart]
      cart = session[:cart]
    end
    if cart[id]
    cart.delete(id)
    end
    session[:cart] = cart
    redirect_to carts_path
  end

  def destroy
    session[:cart] = nil
    redirect_to carts_path
  end
end