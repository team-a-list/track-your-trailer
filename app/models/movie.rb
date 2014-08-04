class Movie < ActiveRecord::Base
  has_many :user_movies
  has_many :users, :through => :user_movies

  validates :name, :rotten_tomatoes_uri, :presence => true
  validates :rotten_tomatoes_uri, :uniqueness => true

  def self.create_from_rotten(movie_hash)
    original_movie_poster = defend_against_thumbnail_images(movie_hash["posters"]["original"])

    Movie.where(:rotten_tomatoes_uri => movie_hash["id"]).first_or_create(
        :name => movie_hash["title"],
        :release_date_theater => movie_hash["release_dates"]["theater"],
        :release_date_dvd => movie_hash["release_dates"]["dvd"],
        :poster_image => original_movie_poster,
        :rotten_tomatoes_uri => movie_hash["id"],
        :poster_image_small => movie_hash["posters"]["thumbnail"],
        :synopsis => movie_hash["synopsis"],
        :rotten_tomatoes_link => movie_hash["links"]["alternate"]
      )
  end

  def update_from_rotten(movie_hash)
    original_movie_poster = Movie.defend_against_thumbnail_images(movie_hash["posters"]["original"])

    self.update(
        :name => movie_hash["title"],
        :release_date_theater => movie_hash["release_dates"]["theater"],
        :release_date_dvd => movie_hash["release_dates"]["dvd"],
        :poster_image => original_movie_poster,
        :rotten_tomatoes_uri => movie_hash["id"],
        :poster_image_small => movie_hash["posters"]["thumbnail"],
        :synopsis => movie_hash["synopsis"],
        :rotten_tomatoes_link => movie_hash["links"]["alternate"]
    )
  end

  private

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

  def self.find_movies_without_release_dates
    self.where("release_date_dvd is null OR release_date_theater is null")
  end

  def self.defend_against_thumbnail_images(poster_url)
    if poster_url.include?('tmb')
      poster_url.gsub('tmb', 'ori')
    elsif poster_url.include?('_thumb')
      poster_url.gsub('_thumb', '')
    end
  end

end