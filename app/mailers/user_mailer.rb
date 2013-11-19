class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email
    mail(to: "emilyxxie@gmail.com", subject: 'Welcome to My Awesome Site')
  end

  def notify(user, notify_day)
    @user = user
    @notify_day = notify_day
    mail(to: @user.email, subject: "Remember this movie you wanted to see?")
  end

end
