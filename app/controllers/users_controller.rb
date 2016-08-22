class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user == current_user || current_admin?
      render :show
    else
      render file: "/errors/not_found"
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.username}"
      if @cart.contents.empty?
        redirect_to user_path(@user)
      else
        redirect_to cart_path
      end
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
