require 'spec_helper'

describe Movie do
  describe 'Standard creation validations' do
    it 'is valid with a name, Rotten Tomatoes id, theater and dvd release date, and poster_image' do
      expect(create(:movie)).to be_valid
    end

    it 'is valid without a theater release date' do
      expect(build(:movie, release_date_theater: nil)).to be_valid
    end

    it 'is valid without a dvd release date' do
      expect(build(:movie, release_date_dvd: nil)).to be_valid
    end

    it 'is valid without a poster_image' do
      expect(build(:movie, poster_image: nil)).to be_valid
    end

    it 'is invalid without a name' do
      expect(build(:movie, name: nil)).to have(1).errors_on(:name)
    end

    it 'is invalid without a Rotten Tomatoes uri' do
      expect(build(:movie, rotten_tomatoes_uri: nil)).to have(1).errors_on(:rotten_tomatoes_uri)
    end

    it 'is invalid with duplicate Rotten Tomatoes id' do
      create(:movie, rotten_tomatoes_uri: 12345)
      expect(build(:movie, rotten_tomatoes_uri: 12345)).to have(1).errors_on(:rotten_tomatoes_uri)
    end
  end

  describe 'Class methods' do
    it 'creates a movie based on a hash structure returned from Rotten Tomatoes' do
      parsed_response={"id"=>"771250004", "title"=>"The Hunger Games: Catching Fire", "year"=>2013, "mpaa_rating"=>"PG-13", "runtime"=>146, "critics_consensus"=>"Smart, smoothly directed, and enriched with a deeper exploration of the franchise's thought-provoking themes, Catching Fire proves a thoroughly compelling second installment in the Hunger Games series.", "release_dates"=>{"theater"=>"2013-11-22"}, "ratings"=>{"critics_rating"=>"Certified Fresh", "critics_score"=>95, "audience_score"=>99}, "synopsis"=>"THE HUNGER GAMES: CATCHING FIRE begins as Katniss Everdeen has returned home safe after winning the 74th Annual Hunger Games along with fellow tribute Peeta Mellark. Winning means that they must turn around and leave their family and close friends, embarking on a \"Victor's Tour\" of the districts. Along the way Katniss senses that a rebellion is simmering, but the Capitol is still very much in control as President Snow prepares the 75th Annual Hunger Games (The Quarter Quell) - a competition that could change Panem forever. (c) Lionsgate", "posters"=>{"thumbnail"=>"http://content7.flixster.com/movie/11/17/38/11173861_mob.jpg", "profile"=>"http://content7.flixster.com/movie/11/17/38/11173861_pro.jpg", "detailed"=>"http://content7.flixster.com/movie/11/17/38/11173861_det.jpg", "original"=>"http://content7.flixster.com/movie/11/17/38/11173861_ori.jpg"}, "abridged_cast"=>[{"name"=>"Jennifer Lawrence", "id"=>"770800260", "characters"=>["Katniss Everdeen"]}, {"name"=>"Josh Hutcherson", "id"=>"162654356", "characters"=>["Peeta Mellark"]}, {"name"=>"Liam Hemsworth", "id"=>"770833479", "characters"=>["Gale Hawthorne"]}, {"name"=>"Elizabeth Banks", "id"=>"162653584", "characters"=>["Effie Trinket"]}, {"name"=>"Stanley Tucci", "id"=>"162661152", "characters"=>["Caesar Flickerman"]}], "alternate_ids"=>{"imdb"=>"1951264"}, "links"=>{"self"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/771250004.json", "alternate"=>"http://www.rottentomatoes.com/m/the_hunger_games_catching_fire/", "cast"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/771250004/cast.json", "clips"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/771250004/clips.json", "reviews"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/771250004/reviews.json", "similar"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/771250004/similar.json"}}
      expect(Movie.create_from_rotten(parsed_response)).to be_valid
    end

    it 'returns a list of movies releasing in theaters today' do
      movie = create(:theater_movie_today)
      expect(Movie.theater_movies_released(0)).to include(movie)
    end

    it 'does not include movies not being released in theaters today' do
      movie = create(:movie, release_date_theater: Time.zone.now.days_since(1).beginning_of_day)
      expect(Movie.theater_movies_released(0)).to_not include(movie)
    end

    it 'returns a list of movies releasing in theaters in 3 days' do
      movie = create(:movie, release_date_theater: Time.zone.now.days_since(3).beginning_of_day)
      expect(Movie.theater_movies_released(3)).to include(movie)
    end

    it 'returns a list of movies releasing on dvd today' do
      movie = create(:dvd_movie_today)
      expect(Movie.dvd_movies_released(0)).to include(movie)
    end

    it 'does not return movies not being released on dvd today' do
      movie = create(:movie, release_date_dvd: Time.zone.now.days_since(1).beginning_of_day)
      expect(Movie.dvd_movies_released(0)).to_not include(movie)
    end

    it 'returns a list of movies releasing on dvd in 3 days' do
      movie = create(:movie, release_date_dvd: Time.zone.now.days_since(3).beginning_of_day)
      expect(Movie.dvd_movies_released(3)).to include(movie)
    end

    it 'returns a list of movies releasing in theaters and on dvd today' do
      theater_movie = create(:theater_movie_today)
      dvd_movie = create(:dvd_movie_today)
      expect(Movie.movies_released(0)).to include(theater_movie, dvd_movie)
    end

    it 'does not return movies not being released in theaters and dvd today' do
      theater_movie = create(:movie, release_date_theater: Time.zone.now.beginning_of_day)
      create(:movie, release_date_dvd: Time.zone.now.days_since(1).beginning_of_day)
      expect(Movie.movies_released(0)).to include(theater_movie)
    end

    it 'returns a list of movies releasing in theaters and on dvd in 3 days' do
      theater_movie = create(:movie, release_date_theater: Time.zone.now.days_since(3).beginning_of_day)
      dvd_movie = create(:movie, release_date_dvd: Time.zone.now.days_since(3).beginning_of_day)
      expect(Movie.movies_released(3)).to include(theater_movie, dvd_movie)
    end
  end

  describe 'Associations' do
    it 'can have users tracking it' do
      user = create(:user)
      movie = create(:movie)
      movie.users << user
      expect(movie.users.count).to eq(1)
    end
  end

end