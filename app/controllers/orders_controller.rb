class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = @user.orders
  end
  
  def create
    @order = current_user.orders.new(status: "ready")
    if @order.save
      @order.record_order_items(@cart)
      session.delete :cart
      # @cart.contents = {}
      flash[:success] = "Order was successfully placed"
      redirect_to orders_path
    else
      flash.now[:error] = "Please log in to place an order"
      redirect_to login_path
    end
  end
end
