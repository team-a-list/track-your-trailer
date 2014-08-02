require "spec_helper"

describe UserMailer do
  describe "e-mail notification types" do
    it "is able to send a reminder email message on release days" do
      user = create(:user)
      mail = UserMailer.notify(user, 0)
      expect(mail.from.first).to eq("trackyourtrailer@gmail.com")
      expect(mail.to.first).to eq("greg.eng@gmail.com")
      expect(mail.subject).to eq("TrackYourTrailer - It's finally out!")
    end
  end
end