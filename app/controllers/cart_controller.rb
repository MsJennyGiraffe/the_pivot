class CartController < ApplicationController
  include CartHelper
  def create
    @item = Item.find(params[:id])
    if current_user
      @cart.add_item(@item.id)
      session[:cart] = @cart.contents
      flash[:success] = "#{@item.title} has been added to cart."
      redirect_to cart_path
    else
      if params[:type] == "bid"
        flash[:warning] = "Login to Bid"
        redirect_to item_path(@item)
      else
        flash[:warning] = "Login to Buyout"
        redirect_to item_path(@item)
      end
    end
  end

  def show
    if @cart.nil?
      flash[:no_items] = "Your cart is currently empty"
    else
      @cart_items = @cart.cart_items
    end
  end

  def update
    item_id = params[:id]
    quantity = params[:quantity]
    @cart.update_quantity(item_id, quantity)
    @cart = session[:cart]
    redirect_to '/cart'
  end

  def destroy
    item = Item.find(params[:id])
    item_id = params[:id]
    @cart.delete(item_id)
    @cart = session[:cart]
    flash[:success] = 'Successfully removed ' + item_removed_from_cart(item) + ' from your cart'
    redirect_to '/cart'
  end

  def change_quantity
    session[:cart][item_id] = params[:id][:quantity]
  end
end
