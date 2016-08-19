class User::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])

    @item.check_bid_status
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

  def update
    @item = Item.find(params[:id])
    if @item.starting_bid < params[:starting_bid].to_f
      @item.update_attribute(:starting_bid, params[:starting_bid])
      flash[:success] = "Placed succesful bid!"
      @item.save
      redirect_to user_item_path(user_slug: @item.user.slug, id: @item.id)
    else
      flash[:warning] = "Must make a bid that is higher than current bid."
      render :show
    end
  end


  def user_item_params
      params.require(:item).permit(:starting_bid,)
  end
end
