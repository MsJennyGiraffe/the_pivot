class User::ItemsController < User::BaseController
  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(user_item_params)
    @user = User.find_by(slug: params[:user_slug])
    if @item.save
      @user.items << @item
      flash[:notice] = "Item Successfully Added To Your Store"
      redirect_to user_item_path(user_slug: @user.slug, id: @item)
    else
      flash[:error]= "Please fill in all fields"
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(user_item_params)
    flash[:success] = "Item Updated!"
    redirect_to user_item_path(user_slug: @item.user.slug, id: @item.id)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.update_attribute(:active, false)
    flash[:notice] = "Item has been removed"
    redirect_to user_path(current_user)
  end


  private
    def user_item_params
        params.require(:item).permit(:title, :description, :image_path, :starting_bid, :expiration_time)
    end
end
