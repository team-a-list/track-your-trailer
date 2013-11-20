class TwilioApi
  ACCOUNT_SID = open('lib/assets/.twilio_sid').read
  AUTH_TOKEN = open('lib/assets/.twilio_auth_token').read
  NUMBER = "+13476948027"
  @CLIENT = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN


  def self.welcome_text(user)
    message = @CLIENT.account.sms.messages.create(
      :body => "Welcome to TrackYourTrailer. Enjoy!",
      :to => user.phone_number,
      :from => NUMBER )
    puts message.sid
  end

  def notify(user, notify_day)
  end

end
