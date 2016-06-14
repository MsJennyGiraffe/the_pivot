class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = @user.orders
  end

  # def create
  #   @order = current_user.orders.new(status: "ready")
  #   if @order.save
  #     @order.record_order_items(@cart)
  #     session.delete :cart
  #     flash[:success] = "Order was successfully placed"
  #     redirect_to orders_path
  #   else
  #     flash.now[:error] = "Please log in to place an order"
  #     redirect_to login_path
  #   end
  # end

  def create
    if current_user
      @order = current_user.orders.new(status: "ready")
      if @order.save
        @order.record_order_items(@cart)
        session.delete :cart
        flash[:success] = "Order was successfully placed"
        redirect_to orders_path
      else
        #what would cause an order not to save?
      end
    else
      flash[:warning] = "Please log in to place an order"
      redirect_to login_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
