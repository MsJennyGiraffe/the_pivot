class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      cookies.signed[:user_id] = @user.id
      if @cart.contents.empty?
        redirect_to user_path(@user)
      else
        redirect_to cart_path
      end
    else
      flash.now[:warning] = "Invalid. Try Again."
      render :new
    end
  end

  def destroy
    ActionCable.server.disconnect(current_user: @current_user)
    @current_user = nil
    cookies.delete(:user_id)
    redirect_to login_path
  end
end
