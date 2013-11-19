require 'spec_helper'

describe UserMovie do
  
  let(:user_movie) {FactoryGirl.create(:user_movie, :user => FactoryGirl.create(:user), :movie => FactoryGirl.create(:movie))}

  context "checking model attributes" do
    it "should have a movie ID foreign key" do
      user_movie.movie_id.should eq(1)
    end
    
    it "should have a  ID foreign key" do
      user_movie.movie_id.should eq(1)
    end
  end

  context "checking associations" do

    it "should be able to access the username" do 
      user_movie.user.name.should eq("Emily")
    end

    it "should be able to access the password" do
      user_movie.user.password.should eq("test")
    end

    it "should be able to access the email" do
      user_movie.user.email.should eq("emily@xie.com")
    end

    it "should be able to access the movie name" do
      user_movie.movie.name.should eq("Chicago")
    end
  end

end
