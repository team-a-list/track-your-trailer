class UserMailer < ActionMailer::Base
  default from: "trackyourtrailer@gmail.com"

  def notify(user, notify_day)
    @user = user
    @notify_day = notify_day
    mail(to: @user.email, subject: "TrackYourTrailer - It's finally out!")
  end

end
