class UserMailer < ActionMailer::Base
  default from: "duchiep.ap@gmail.com"
  def active_Key_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Active Account')
  end
end
