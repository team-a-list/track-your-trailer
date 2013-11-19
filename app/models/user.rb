class User < ActiveRecord::Base
  has_many :user_movies
  has_many :movies, :through => :user_movies

  def self.users_for(movie_list)
    movie_list.collect(&:users).uniq(&:name)
  end
end
