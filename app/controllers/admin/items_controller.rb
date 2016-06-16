class Admin::ItemsController < Admin::BaseController
  def new
    @item = Item.new
    @categories = Category.all.map { |category| [category.title, category.id] }
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "item has been created"
      redirect_to items_path
    else
      flash[:warning] = @item.errors.full_messages.join(", ")
      redirect_to new_admin_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :description, :image_path, :category_id, :weight, :stock)
  end
end
