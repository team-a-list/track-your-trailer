
class RottenTomatoesApi

  def self.search(search_string)
    search_results = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{ENV['API_KEY']}&q=#{URI.escape(search_string)}&page_limit=6", :format => :json)
    if search_results.has_key?("movies")
      search_results
    else
      self.upcoming_movies
    end
  end

  def self.get_movie(movie_id)
    HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies/#{movie_id}.json?apikey=#{ENV['API_KEY']}", :format => :json)
  end

  def self.upcoming_movies
    HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/upcoming.json?apikey=#{ENV['API_KEY']}&page_limit=6", :format => :json)
  end

  def self.upcoming_dvds
    HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/upcoming.json?apikey=#{ENV['API_KEY']}&page_limit=6", :format => :json)
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

  def self.update_all_movies
    Movie.all.each do |movie|
      movie_hash = self.get_movie(movie.rotten_tomatoes_uri)
      movie.update_from_rotten(movie_hash)
    end
  end

  def self.update_movie_default_posters
    movies = Movie.arel_table
    default_thumbnail_poster_movies = Movie.where(movies[:poster_image].matches("%_thumb%"))
    default_thumbnail_poster_movies.each do |movie|
      replacement_image = movie.poster_image.gsub('_thumb', '')
      movie.update_attribute(:poster_image, replacement_image)
    end
  end

  def self.update_movie_posters
    movies = Movie.arel_table
    thumbnail_poster_movies = Movie.where(movies[:poster_image].matches("%tmb%"))
    thumbnail_poster_movies.each do |movie|
      replacement_image = movie.poster_image.gsub('tmb', 'ori')
      movie.update_attribute(:poster_image, replacement_image)
    end
  end

end
