class RottenTomatoesApi
  API_KEY = open('lib/assets/.rotten_tomatoes_api_key').read()

  def self.search(search_string)
    HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{API_KEY}&q=#{URI.escape(search_string)}&page_limit=5", :format => :json)
  end

  def self.get_movie(movie_id)
    HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies/#{movie_id}.json?apikey=#{API_KEY}", :format => :json)
  end

  def self.upcoming_movies
    HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/upcoming.json?apikey=#{API_KEY}&page_limit=5", :format => :json)
  end

  def self.upcoming_dvds
    HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/upcoming.json?apikey=#{API_KEY}&page_limit=5", :format => :json)
  end

  def self.seed_upcoming_movies
      self.upcoming_movies["movies"].each do |movie|
        Movie.create_from_rotten(movie)
    end
  end

  def self.seed_upcoming_dvds
      self.upcoming_dvds["movies"].each do |movie|
        Movie.create_from_rotten(movie)
    end
  end

end
