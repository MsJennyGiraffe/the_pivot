class CartController < ApplicationController
  def create
    @item = Item.find(params[:id])
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    flash[:success] = "#{@item.title} has been added to cart."
    redirect_to item_path(@item)
  end

  def show
    @cart = session[:cart]
    @items = Item.find_by_id(@cart)
  end
end
