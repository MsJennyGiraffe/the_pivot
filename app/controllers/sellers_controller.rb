class SellersController < ApplicationController

  def index
    @sellers = User.where(approved: true)
  end

  def show
    @seller = User.find_by(slug: params[:user_slug])
    if @seller.approved
      render :show
    else
      render file: "/errors/not_found" unless current_admin?
    end
  end
end
