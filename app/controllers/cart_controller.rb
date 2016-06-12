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
    if @cart.nil?
      flash[:no_items] = "Your cart is currently empty"
    else
      @item_ids = @cart.keys
      @items = Item.where(id: @item_ids)
    end
  end
end
