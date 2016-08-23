class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if Item.check_bid(@item,params,current_user,flash) == 1
      redirect_to item_path(@item)
    else
      render :show
    end
  end
end
