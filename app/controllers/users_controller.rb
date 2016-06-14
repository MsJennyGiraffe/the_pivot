class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.username}"
      if @cart.contents.empty?
        redirect_to user_dashboard_path
      else
        redirect_to cart_path
      end
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
