class Admin::PlatformAdminController < Admin::BaseController
  def index
    if current_user.platform_admin?
      @users = User.where(requested: true)
      @not_approved =  User.where(requested: false, role: "seller").reverse
      @approved = User.where(approved: true)
    else
      render file: "/errors/not_found"
    end
  end

  def update
    user = User.find(params[:id])
    if params[:approved]
      user.update_role
      flash[:success] = "Seller approved!"
      redirect_to admin_platform_admin_index_path
    else
      user.update_attributes(requested: false, approved: false)
      flash[:warning] = "Seller denied."
      redirect_to admin_platform_admin_index_path
    end
  end
end
