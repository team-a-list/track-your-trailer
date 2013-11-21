require 'spec_helper'

describe Movie do
  describe 'Standard creation validations' do
    it 'is valid with a name, Rotten Tomatoes id, theater and dvd release date, and poster_image'

    it 'is valid without a theater release date'
    it 'is valid without a dvd release date'
    it 'is valid without a poster_image'
    it 'is invalid without a name'
    it 'is invalid without a Rotten Tomatoes id'

    it 'is invalid with duplicate Rotten Tomatoes id'
  end

  describe 'Class methods' do
    it 'creates a movie based on a hash structure returned from Rotten Tomatoes'

    it 'returns a list of movies releasing in theaters today'
    it 'returns a list of movies releasing in theaters in 3 days'

    it 'returns a list of movies releasing on dvd today'
    it 'returns a list of movies releasing on dvd in 3 days'

    it 'returns a list of movies releasing in theaters and on dvd today'
    it 'returns a list of movies releasing in theaters and on dvd in 3 days'
  end

  describe 'Associations' do
    it 'can have users tracking it'
  end
  
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
