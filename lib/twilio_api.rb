class TwilioApi
  NUMBER = "+13476948027"
  @CLIENT = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

  def self.welcome_text(user)
    message = @CLIENT.account.sms.messages.create(
      :body => "Welcome to TrackYourTrailer. Enjoy!",
      :to => user.phone_number,
      :from => NUMBER )
    puts message.sid
    message
  end

  def self.notify(user, notify_day)
    message = @CLIENT.account.sms.messages.create(
      :body => "TrackYourTrailer reminder! Remember this movie? See it today: " + user.text_notification(notify_day),
      :to => user.phone_number,
      :from => NUMBER )
    puts message.sid
    message
  end

  def self.send_verification(user, url=Rails.application.config.url)
    message = @CLIENT.account.sms.messages.create(
      :body => "Verify your TrackYourTrailer phone # at http://#{url}/v/#{user.text_token}",
      :to => user.phone_number,
      :from => NUMBER
    )
    puts message.sid
    message
  end

end
