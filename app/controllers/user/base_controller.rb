class User::BaseController < ApplicationController
  before_action :require_seller

  def require_seller
    render file: "/public/404" unless (current_seller? || current_admin?)
  end

  def current_seller?
    current_user && current_user.role == "seller"
  end
end
