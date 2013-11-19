class User < ActiveRecord::Base
  has_many :user_movies
  has_many :movies, :through => :user_movies

  validates :email, :uniqueness => true

  def self.users_for(notify_day = 0)
    movie_list = Movie.includes(:users).movies_released(notify_day)
    movie_list.map{|movie| movie.users}.flatten.uniq
    #UserMovie.where(:movie_id => movie_list)
  end

  def movie_notifications(notify_day = 0)
    theater = self.movies.where(:release_date_theater => Time.zone.now.days_since(notify_day).beginning_of_day)
    dvd = self.movies.where(:release_date_dvd => Time.zone.now.days_since(notify_day).beginning_of_day)
    theater.concat(dvd)
  end

end
