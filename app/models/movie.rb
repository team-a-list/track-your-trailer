class Movie < ActiveRecord::Base
  has_many :user_movies
  has_many :users, :through => :user_movies

  def self.theater_movies_released(days_until = 0)
    Movie.where(:release_date_theater => Time.zone.now.days_since(days_until).beginning_of_day)
  end

  def self.dvd_movies_released(days_until = 0)
    Movie.where(:release_date_dvd => Time.zone.now.days_since(days_until).beginning_of_day)
  end
end
