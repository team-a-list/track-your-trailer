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
    Movie.create(
      :name => movie_hash["title"],
      :release_date_theater => movie_hash["release_dates"]["theater"],
      :release_date_dvd => movie_hash["release_dates"]["dvd"],
      :poster_image => movie_hash["posters"]["original"]
    )
  end

end