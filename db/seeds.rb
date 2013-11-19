# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movie3 = Movie.create(name: "The Hunger Games: Catching Fire", release_date_theater: "2013-11-22", release_date_dvd: nil, poster_image: "http://content7.flixster.com/movie/11/17/38/11173861_ori.jpg")
movie4 = Movie.create(name: "2 Guns", release_date_theater: "2013-08-02", release_date_dvd: "2013-11-19", poster_image: "http://content7.flixster.com/movie/11/17/46/11174605_ori.jpg")
movie5 = Movie.create(name: "The World's End", release_date_theater: "2013-08-23", release_date_dvd: "2013-11-19", poster_image: "http://content7.flixster.com/movie/11/17/15/11171553_ori.jpg")
movie6 = Movie.create(name: "The Wolf of Wall Street", release_date_theater: "2013-12-25", release_date_dvd: nil, poster_image: "http://content6.flixster.com/movie/11/17/19/11171924_ori.jpg")


user1 = User.create(name: "Emily", email: "emily@xie.com", phone_number: "207-999-9999", password: "test")
user2 = User.create(name: "David", email: "david@bella.com", phone_number: "999-999-9999", password: "test")
user3 = User.create(name: "Greg", email: "greg@eng.com", phone_number: "555-555-5555", password: "test")

user_movies1 = UserMovie.create(user: user1, movie: movie1)
user_movies2 = UserMovie.create(user: user1, movie: movie2)
user_movies3 = UserMovie.create(user: user2, movie: movie1)

# require 'httparty'

# HTTParty.get('http://api.rottentomatoes.com/api/public/v1.0/movies/770672122.json?apikey=[API KEY GOES HERE]', :format => :json)
# HTTParty.get('http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[API KEY GOES HERE]&q=lord%20of%20the%20rings&page_limit=5', :format => :json)


# # movie info =
# movie["title"]

# # movie theater release =
# movie["release_dates"]["theater"]

# # movie dvd release =
# movie["release_dates"]["dvd"]

# # movie poster image link
# movie["posters"]["original"]

# # movie search , we can limit to 1-5 maybe
# HTTParty.get('http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[API KEY GOES HERE]&q=toy%20story%203&page_limit=5', :format => :json)

# # array of movies by search terms, limited to 5
# movie_search["movies"]

# # the first movie .. this returns a similar object ... or you could just use the id to grab the specific movie info json page above
# movie_search["movies"].first["id"]

# HTTParty.get('http://api.rottentomatoes.com/api/public/v1.0/movies/770672122.json?apikey=[API KEY GOES HERE]', :format => :json)

# HTTParty.get('http://api.rottentomatoes.com/api/public/v1.0/movies/10156.json?apikey=[API KEY GOES HERE]', :format => :json)

