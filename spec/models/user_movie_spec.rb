require 'spec_helper'

describe UserMovie do
  context "Emily likes Chicago" do
    it "should have the username" do 
      user_movie = FactoryGirl.create(:user_movie, :user => FactoryGirl.create(:user), :movie => FactoryGirl.create(:movie))
      user_movie.user.name.should eq("Emily")
    end
  end
end
