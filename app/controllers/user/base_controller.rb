class User::BaseController < ApplicationController
  before_action :require_seller

  def require_seller
    render file: "/errors/not_found" unless (current_seller? || current_admin?)
  end

  def current_seller?
    current_user && current_user.role == "seller"
  end
end
