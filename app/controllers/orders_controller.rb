class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = @user.orders
  end

  def create
    @order = Order.create_order(current_user,@cart,session,flash) if current_user
    if @order != "Cart Empty"
      EmailConfirmationMailer.confirmation(current_user, @order).deliver_now
      redirect_to order_path(@order)
    else
      flash[:warning] = "Cart Empty"
      redirect_to cart_path
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
