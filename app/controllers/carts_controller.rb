class CartsController < ApplicationController
  def index
    @carts = session[:cart] ||= {}
  end

  def add
    id = params[:id]
    quantity = params[:quantity].to_i
    if Product.where(id: id, stock: 0).empty?
      session[:cart] ||= {}
      if session[:cart]
        cart = session[:cart]
      end
      if id && (quantity > 1)
        if cart[id]
          cart.each do |key, value|
            if key == id
              cart[id] = (value.to_i + quantity)
            end
          end
        else
          cart[id] = quantity
        end
      elsif id && (quantity == 1)
        cart[id] ? cart[id] += 1 : cart[id] =1
      else
        cart[id] ? cart[id] += 1 : cart[id] =1
      end
      redirect_to carts_path
    else
      flash[:error] = "Product not available !!!"
      redirect_to :back
    end
  end

  def add_cart_ajax
    id = params[:id]
    if Product.where(id: id, stock: 0).empty?
      session[:cart] ||= {}
      if session[:cart]
        cart = session[:cart]
      end
      if cart[id]
        cart[id] += 1
      else
        cart[id] = 1
      end
      respond_to do |format|
        format.json {
          render json: cart
        }
      end
    else
      flash[:error] = "Product not available !!!"
      redirect_to :back
    end
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