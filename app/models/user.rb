class User < ActiveRecord::Base
  has_many :user_movies
  has_many :movies, :through => :user_movies

  validates :email, :uniqueness => true

  def self.users_for(notify_day = 0)
    movie_list = Movie.movies_released(notify_day)
    # movie_list.collect(&:users).uniq(&:name)
    user_list = []

    movie_list.each do |movie|
      movie.users.each do |user|
        user_list << user
      end
    end

    user_list
  end
end
