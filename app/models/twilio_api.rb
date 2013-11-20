class TwilioApi
  ACCOUNT_SID = open('lib/assets/.twilio_sid').read()
  AUTH_TOKEN = open('lib/assets/.twilio_auth_token').read()

  def self.test
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    message = @client.account.sms.messages.create(
      :body => "Remember that movie you wanted to see? It's out today!",
      :to => "",     # Replace with your phone number
      :from => "+15128722533")   # Replace with your Twilio number
    puts message.sid
  end

end
