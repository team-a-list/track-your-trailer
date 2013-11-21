class RottenTomatoesApi

  def self.search(search_string)
    HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{ENV['API_KEY']}&q=#{URI.escape(search_string)}&page_limit=5", :format => :json)
  end

  def self.get_movie(movie_id)
    HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies/#{movie_id}.json?apikey=#{ENV['API_KEY']}", :format => :json)
  end

  def self.upcoming_movies
    HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/upcoming.json?apikey=#{ENV['API_KEY']}&page_limit=5", :format => :json)
  end

  def self.upcoming_dvds
    HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/upcoming.json?apikey=#{ENV['API_KEY']}&page_limit=5", :format => :json)
  end

  def self.seed_search(search_string)
    self.search(search_string)["movies"].collect do |movie|
      Movie.create_from_rotten(movie)
    end
  end

  def self.seed_upcoming_theater
    self.upcoming_movies["movies"].each do |movie|
      Movie.create_from_rotten(movie)
    end
  end

  def self.seed_upcoming_dvds
    self.upcoming_dvds["movies"].each do |movie|
      Movie.create_from_rotten(movie)
    end
  end

  def self.update_existing_movies
    movies = Movie.find_movies_without_release_dates
    movies.each do |movie|
      movie_hash = self.get_movie(movie.rotten_tomatoes_uri)
      movie.update_from_rotten(movie_hash)
    end
  end

end
