class CartController < ApplicationController
  include CartHelper
  def create
    @item = Item.find(params[:id])
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    flash[:success] = "#{@item.title} has been added to cart."
    cart_path_filter
  end

  def show
    if @cart.contents == {}
      flash[:no_items] = "Your cart is currently empty"
    else
      @cart_items = @cart.cart_items
    end
  end

  def destroy
    item = Item.find(params[:id])
    item_id = params[:id]
    @cart.delete(item_id)
    @cart = session[:cart]
    flash[:success] = 'Successfully removed ' + item_removed_from_cart(item) + ' from your cart'
    redirect_to '/cart'
  end

  def cart_path_filter
    if !current_user && params[:type] == "bid"
      flash[:warning] = "Login to Bid"
      redirect_to user_item_path(user_slug: @item.user.slug, id: @item.id)
    elsif !current_user
      flash[:warning] = "Login to Buyout"
      redirect_to user_item_path(user_slug: @item.user.slug, id: @item.id)
    else
      redirect_to cart_path
    end
  end
end
