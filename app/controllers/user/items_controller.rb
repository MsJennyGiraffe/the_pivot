class User::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(user_item_params)
    if @item.save
      current_user.items << @item
      flash[:notice] = "Item Successfully Added To Your Store"
      redirect_to user_item_path(user_slug: current_user.slug, id: @item)
    else
      flash[:error]= "Please fill in all fields"
      render :new
    end
  end

  def index
    @items = current_user.items
  end

  private

  def user_item_params
      params.require(:item).permit(:title, :description, :starting_bid, :image_path, :expiration_time)
  end
end
