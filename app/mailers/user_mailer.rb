class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to TrackYourTrailer')
  end

  def notify(user, notify_day)
    @user = user
    @notify_day = notify_day
    mail(to: @user.email, subject: "Remember this movie you wanted to see?")
  end

end
