# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movie1 = Movie.create(name: "The Hunger Games: Catching Fire", release_date_theater: "2013-11-22", release_date_dvd: nil, poster_image: "http://content7.flixster.com/movie/11/17/38/11173861_ori.jpg", rotten_tomatoes_uri: 771250004)
movie2 = Movie.create(name: "2 Guns", release_date_theater: "2013-08-02", release_date_dvd: "2013-11-19", poster_image: "http://content7.flixster.com/movie/11/17/46/11174605_ori.jpg", rotten_tomatoes_uri: 771310388)
movie3 = Movie.create(name: "The World's End", release_date_theater: "2013-08-23", release_date_dvd: "2013-11-19", poster_image: "http://content7.flixster.com/movie/11/17/15/11171553_ori.jpg", rotten_tomatoes_uri: 771307256)
movie4 = Movie.create(name: "The Wolf of Wall Street", release_date_theater: "2013-12-25", release_date_dvd: nil, poster_image: "http://content6.flixster.com/movie/11/17/19/11171924_ori.jpg", rotten_tomatoes_uri: 771305721)


# user1 = User.create(name: "Emily", email: "emily@xie.com", phone_number: "12073996370", password: "test", password_confirmation: "test")
# user2 = User.create(name: "David", email: "david@bella.com", phone_number: "18603185598", password: "test", password_confirmation: "test")
# user3 = User.create(name: "Greg", email: "greg@eng.com", phone_number: "19739412628", password: "test", password_confirmation: "test")

# user_movies1 = UserMovie.create(user: user1, movie: movie1)
# user_movies2 = UserMovie.create(user: user1, movie: movie2)
# user_movies3 = UserMovie.create(user: user2, movie: movie1)


