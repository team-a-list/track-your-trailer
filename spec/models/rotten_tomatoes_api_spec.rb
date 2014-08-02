require 'spec_helper'

describe RottenTomatoesApi do
  describe 'search query methods' do
    it 'should allow searches with valid search strings' do
      search_string = "Toy Story"
      search_results = RottenTomatoesApi.search(search_string)

      expect(search_results.class).to eq(HTTParty::Response)
      expect(search_results).to have_key("movies")
      expect(search_results["movies"].length).to be <= (6)
    end

    it 'should not error if no movies are found via search' do
      search_string = "1NVAL1D M0VI3"
      search_results = RottenTomatoesApi.search(search_string)

      expect(search_results.class).to eq(HTTParty::Response)
      expect(search_results).to have_key("movies")
      expect(search_results["movies"].length).to eq(0)
    end
  end

  describe 'general content query methods' do
    it 'should query rotten tomatoes for upcoming theater releases' do
      upcoming_theater_releases = RottenTomatoesApi.upcoming_movies

      expect(upcoming_theater_releases.class).to eq(HTTParty::Response)
      expect(upcoming_theater_releases).to have_key("movies")

      upcoming_movie = upcoming_theater_releases["movies"][0]
      expect(upcoming_movie.class).to eq(Hash)
      expect(upcoming_movie).to have_key("release_dates")
      expect(upcoming_movie["release_dates"]).to have_key("theater")

      theater_release_date = upcoming_movie["release_dates"]["theater"]
      expect(theater_release_date.to_time).to be > Time.now
    end

    it 'should query rotten tomatoes for upcoming dvd releases' do
      upcoming_dvd_releases = RottenTomatoesApi.upcoming_dvds

      expect(upcoming_dvd_releases.class).to eq(HTTParty::Response)
      expect(upcoming_dvd_releases).to have_key("movies")

      upcoming_movie = upcoming_dvd_releases["movies"][0]
      expect(upcoming_movie.class).to eq(Hash)
      expect(upcoming_movie).to have_key("release_dates")
      expect(upcoming_movie["release_dates"]).to have_key("dvd")

      dvd_release_date = upcoming_movie["release_dates"]["dvd"]
      expect(dvd_release_date.to_time).to be > Time.now
    end

    it "should query for a specific movie using it's rotten tomatoes id" do
      movie = create(:specific_movie)
      rt_movie_object = RottenTomatoesApi.get_movie(movie.rotten_tomatoes_uri)

      expect(rt_movie_object.class).to eq(HTTParty::Response)
      expect(rt_movie_object).to have_key("id")
      expect(rt_movie_object["id"]).to eq(movie.rotten_tomatoes_uri)
    end
  end

  describe 'content seeding methods' do
    it "can persist 6 new movies from the upcoming movies endpoint at a time" do
      original_movie_count = Movie.all.size
      RottenTomatoesApi.seed_upcoming_theater
      post_seed_movie_count = Movie.all.size

      expect(original_movie_count).to eq(0)
      expect(post_seed_movie_count).to eq(6)
    end

    it "can persist 6 new dvds from the upcoming dvds endpoint at a time" do
      original_dvd_count = Movie.all.size
      RottenTomatoesApi.seed_upcoming_dvds
      post_seed_dvd_count = Movie.all.size

      expect(original_dvd_count).to eq(0)
      expect(post_seed_dvd_count).to eq(6)
    end

    it "can persist new movies from the search endpoint" do
      search_string = "Toy Story"
      original_movie_count = Movie.all.size
      RottenTomatoesApi.seed_search(search_string)
      post_seed_movie_count = Movie.all.size

      expect(original_movie_count).to eq(0)
      expect(post_seed_movie_count).to be > 0
    end
  end

  describe 'content updating methods' do
    it "can update existing movies when they have new changed meta data information" do
      movie = create(:nil_release_date_dvd_movie)
      movie = create(:nil_release_date_theater_movie)
      updateable_movie_count = Movie.find_movies_without_release_dates.size
      RottenTomatoesApi.update_existing_movies
      updated_movie_count = Movie.find_movies_without_release_dates.size

      expect(updateable_movie_count).to eq(2)
      expect(updated_movie_count).to eq(0)
    end
  end

end
