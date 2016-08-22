class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = @user.orders
  end

  def create
    if current_user
      @order = Order.from_cart(@cart, user: current_user)
      @order.update_attribute(:status, "completed")
      if @order.save
        @cart.cart_items.each do |cart_item|
          cart_item_id = cart_item.id
          item = Item.find(cart_item_id)
          item.save
        end
        session.delete :cart
        flash[:success] = "Order was successfully placed"
        redirect_to order_path(@order)
      end
    end
  end

  def show
    @order = Order.find(params[:id])
    if @order.user == current_user || current_admin?
      render :show
    else
      render file: "/errors/not_found"
    end
  end
end
