class Movie < ActiveRecord::Base
  has_many :user_movies
  has_many :users, :through => :user_movies

  validates :name, :rotten_tomatoes_uri, :presence => true
  validates :rotten_tomatoes_uri, :uniqueness => true

  def self.movies_released(days_until = 0)
    theater = Movie.theater_movies_released(days_until)
    dvd = Movie.dvd_movies_released(days_until)
    theater.concat(dvd)
  end

  def self.theater_movies_released(days_until = 0)
    Movie.where(:release_date_theater => Time.zone.now.days_since(days_until).beginning_of_day)
  end

  def self.dvd_movies_released(days_until = 0)
    Movie.where(:release_date_dvd => Time.zone.now.days_since(days_until).beginning_of_day)
  end

  def self.create_from_rotten(movie_hash)
    # raise
    # if !Movie.find_by(:rotten_tomatoes_uri => movie_hash["id"])
    Movie.where(:rotten_tomatoes_uri => movie_hash["id"]).first_or_create(
      # Movie.create(
        :name => movie_hash["title"],
        :release_date_theater => movie_hash["release_dates"]["theater"],
        :release_date_dvd => movie_hash["release_dates"]["dvd"],
        :poster_image => movie_hash["posters"]["original"],
        :rotten_tomatoes_uri => movie_hash["id"]
      )
    # end
  end

  def self.find_movies_without_release_dates
    self.where("release_date_dvd is null OR release_date_theater is null")
  end

  def update_from_rotten(movie_hash)
    self.update(
      :release_date_theater => movie_hash["release_dates"]["theater"],
      :release_date_dvd => movie_hash["release_dates"]["dvd"]
    )
  end

# but first well have to use rotten tomatoes to search and get the ids to begin with !!

# We want to display a list of movies (5) that a use searches for.
# It should display movies from our database if we have them
# but if we dont ... then we gotta get em from rotten tomatoes
# in the controller .. the user will enter a string in the search parameters.

# def search end
  # it will call the 2 methods in the RT api
  # then it will perform logic to get the movie ids out of that call
  # then it will call display movies from the movie.rb and pass in the movie ids in an array
  # then it ill redirect to the search index page

end
