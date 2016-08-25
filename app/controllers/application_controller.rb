class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :set_cart

  def current_user
    @current_user ||= User.find(cookies.signed[:user_id]) if cookies.signed[:user_id]
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_admin?
    current_user && current_user.platform_admin?
  end

end
