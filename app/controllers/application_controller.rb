class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :set_cart

  def user_dashboard_path
    if current_admin?
      admin_dashboard_path
    else
      dashboard_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
