class ReservationsController < ApplicationController
  before_action :get_order, only: [:new, :create]
  before_action :new_reservation, only: [:new, :create]

  def new
  end

  def create
    @reservation.update_attributes(pickup_time: params.require(:reservation).to_s.to_time)
    if @reservation.save
      redirect_to order_path(@order)
    else
      flash[:error] = @reservation.errors.full_messages
      render :new
    end
  end

  private

  def get_order
    @order = Order.find(params.require(:order_id))
  end

  def new_reservation
    @reservation = Reservation.new(order: @order)
  end
end
