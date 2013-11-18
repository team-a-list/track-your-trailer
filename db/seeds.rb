# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movie1 = Movie.create(name: "Chicago", release_date_theater: "#{Time.now}", release_date_dvd: "#{Time.now}", poster_image: "http://thispicture.jpg")
movie2 = Movie.create(name: "Toy Story", release_date_theater: "#{Time.now}", release_date_dvd: "#{Time.now}", poster_image: "http://thispicture.jpg")
   
user1 = User.create(name: "Emily", email: "emily@xie.com", phone_number: "207-999-9999", password: "test")
user2 = User.create(name: "David", email: "david@bella.com", phone_number: "999-999-9999", password: "test")

user_movies1 = UserMovie.create(user: user1, movie: movie1)
user_movies2 = UserMovie.create(user: user1, movie: movie2)
user_movies3 = UserMovie.create(user: user2, movie: movie1)

