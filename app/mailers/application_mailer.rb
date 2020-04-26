class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def post_email(user, link)
    @user = user
    @url = link
    mail(:to => @user.email, :subject => "New ticket assignment")
  end
end
