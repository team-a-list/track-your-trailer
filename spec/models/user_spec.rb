require 'spec_helper'

describe User do
  describe "User Attributes" do
    it "should have a name" do
      user = FactoryGirl.create(:user)
      user.name.should eq("Emily")
    end

    it "should have a valid password" do
      user = FactoryGirl.create(:user)
      user.password.should eq("test")
    end

    it "should have an email" do
      user = FactoryGirl.create(:user)
      user.email.should eq("emily@xie.com")
    end

    it "should have a phone number" do
      user = FactoryGirl.create(:user)
      user.phone_number.should eq("15555555555")
    end

  end
end
