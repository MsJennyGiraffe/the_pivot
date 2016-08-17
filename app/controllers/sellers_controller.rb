class SellersController < ApplicationController

  def index
    @sellers = User.all
  end

  def show
    @seller = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end

end