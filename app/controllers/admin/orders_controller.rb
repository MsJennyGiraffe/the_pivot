class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(status: params[:order_status])
      flash[:success] = "Status has been successfully changed to #{@order.status}"
      redirect_to admin_order_path(@order)
    else
      flash[:warning] = "Order cannot be updated"
      redirect_to admin_order_path(@order)
    end
  end
end
