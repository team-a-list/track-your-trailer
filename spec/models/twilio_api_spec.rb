require 'spec_helper'

describe TwilioApi do
  describe "text message notification types" do
    it "is able to send a welcome message to new users" do
      user = create_twilio_message_receiver

      message = TwilioApi.welcome_text(user)
      expect(message.sid).to start_with("SM")
      expect(message.sid.length).to eq(34)
      expect(message.body).to eq("Welcome to TrackYourTrailer. Enjoy!")
    end

    it "is able to send a reminder text message on release days" do
      user = create_twilio_message_receiver

      message = TwilioApi.notify(user, 3)
      expect(message.sid).to start_with("SM")
      expect(message.sid.length).to eq(34)
      expect(message.body).to include("TrackYourTrailer reminder! Remember this movie? See it today:")
    end

    it "is able to send a verification url via text message" do
      user = create(:text_verified_user, phone_number: 19703643143)

      message = TwilioApi.send_verification(user, 'trackyourtrailer.herokuapp.com')
      expect(message.sid).to start_with("SM")
      expect(message.sid.length).to eq(34)
      expect(message.body).to include("Verify your TrackYourTrailer phone # at http://trackyourtrailer.herokuapp.com/v/")
    end
  end
end

def create_twilio_message_receiver
  create(:user, phone_number: 19703643143)
end
