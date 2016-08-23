class EmailConfirmationMailer < ApplicationMailer
  def confirmation(user, order)
    @user = user
    @order = order
    mail(to: user.email, subject: "Your order has been successfully placed")
  end
end
