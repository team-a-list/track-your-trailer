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



# # movie search , we can limit to 1-5 maybe
# HTTParty.get('http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[API KEY GOES HERE]&q=toy%20story%203&page_limit=5', :format => :json)

# # array of movies by search terms, limited to 5
# movie_search["movies"]

# # the first movie .. this returns a similar object ... or you could just use the id to grab the specific movie info json page above
# movie_search["movies"].first["id"]

# HTTParty.get('http://api.rottentomatoes.com/api/public/v1.0/movies/770672122.json?apikey=[API KEY GOES HERE]', :format => :json)

# HTTParty.get('http://api.rottentomatoes.com/api/public/v1.0/movies/10156.json?apikey=[API KEY GOES HERE]', :format => :json)

end
