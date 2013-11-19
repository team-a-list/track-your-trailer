class User < ActiveRecord::Base
  has_many :user_movies
  has_many :movies, :through => :user_movies

  validates :email, :uniqueness => true

  def self.users_for(notify_day = 0)
    movie_list = Movie.movies_released(notify_day)

    # movie_list.collect(&:users).uniq(&:name).flatten
    #condense into a database query
    #users that have at least one movie that's coming out on day
    movie_list.collect do |movie|
      movie.users.uniq(&:email)
    end.flatten
  end

end
