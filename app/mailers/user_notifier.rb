class UserNotifier < ActionMailer::Base
  default from: 'nerdsnap@gmail.com'

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

  def approved_seller(user)
    @user = user
    @url  = "http://nerdsnap.herokuapp.com/login"
    mail(to: @user.email, subject: "Welcome to nerdSnap!")
  end
end
