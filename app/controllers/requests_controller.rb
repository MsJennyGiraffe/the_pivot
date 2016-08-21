class RequestsController < ApplicationController
  def update
    user = User.find(params[:id])
    user.update_attribute(:requested, true)
    flash[:success] = "Successfully requested to become a seller."
    redirect_to user_path(user)
  end
end
