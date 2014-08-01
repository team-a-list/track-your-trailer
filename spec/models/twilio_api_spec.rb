require 'spec_helper'

describe TwilioApi do
  describe "text message notification types" do
    it "is able to send a welcome message to new users" do
      user = create_twilio_message_receiver

      succesful_message_id = TwilioApi.welcome_text(user)
      expect(succesful_message_id).to start_with("SM")
      expect(succesful_message_id.length).to eq(34)
    end

  end
end

def create_twilio_message_receiver
  create(:user, phone_number: 19703643143)
end
