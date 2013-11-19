require 'spec_helper'

describe Movie do
  
  describe "Movie attributes" do
    it "should have a name" do
      movie = FactoryGirl.create(:movie)
      movie.name.should eq("Chicago")
    end 

    it "should have a theater release date" do
      movie = FactoryGirl.create(:movie)
      movie.release_date_dvd.should eq("2013-11-18 16:25:30")
    end

    it "should have a dvd release date" do
      movie = FactoryGirl.create(:movie)
      movie.release_date_dvd.should eq("2013-11-18 16:25:30")
    end

    it "should have a poster image" do
      movie = FactoryGirl.create(:movie)
      movie.poster_image.should eq("chicago.jpg")
    end

  end
end
