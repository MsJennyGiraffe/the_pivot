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
          item.stock = item.stock - cart_item.quantity.to_i
          item.save
        end
        session.delete :cart
        flash[:success] = "Order was successfully placed"
        redirect_to new_order_reservation_path(@order)
      end
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
