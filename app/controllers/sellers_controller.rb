class SellersController < ApplicationController

  def index
    @sellers = User.where(approved: true)
  end

  def show
    @seller = User.find_by(slug: params[:user_slug])
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end

end
