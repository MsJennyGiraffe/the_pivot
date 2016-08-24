class UserNotifier < ActionMailer::Base
  default from: 'do-not-reply@nerdsnap.herokuapp.com'

  def confirmation(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: "Your order has been successfully placed")
  end

  def send_signup_email(user)
    @user = user
    @url  = "http://nerdsnap.herokuapp.com/login"
    mail(to: @user.email, subject: "Welcome to nerdSnap!")
  end
end
