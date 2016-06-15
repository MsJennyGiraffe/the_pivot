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
        session.delete :cart
        flash[:success] = "Order was successfully placed"
        redirect_to new_order_reservation_path(@order)
      else
        # what would cause an order not to save?
        # flash[:warning] = "Please log in to place an order"
        # redirect_to login_path
      end
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
