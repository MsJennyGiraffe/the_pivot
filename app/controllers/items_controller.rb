class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if current_user
      if @item.starting_bid < params[:starting_bid].to_f
        @item.update_attribute(:starting_bid, params[:starting_bid])
        flash[:success] = "Placed succesful bid!"
        Bid.create(price: params[:starting_bid], user: current_user, item: @item)
        redirect_to item_path(@item)
      else
        flash[:warning] = "Must make a bid that is higher than current bid."
        render :show
      end
    else
      flash[:warning] = "Login to Bid"
      render :show
    end
  end
end
