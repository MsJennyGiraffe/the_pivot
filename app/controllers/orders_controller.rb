class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = @user.orders
  end

  def create
    if current_user
      @order = current_user.orders.new(status: "ready")
      if @order.save
        @order.record_order_items(@cart)

        @cart.cart_items.each do |cart_item|
          cart_item_id = cart_item.id
          item = Item.find(cart_item_id)
          item.stock = item.stock - cart_item.quantity.to_i
          item.save
        end
        session.delete :cart
        flash[:success] = "Order was successfully placed"
        redirect_to orders_path
      end
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
