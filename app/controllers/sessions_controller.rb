class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @cart.contents.empty?
        redirect_to user_dashboard_path
      else
        redirect_to cart_path
      end
    else
      flash[:alert] = "Invalid. Try Again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
