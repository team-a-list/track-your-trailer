class User < ActiveRecord::Base
  has_many :user_movies
  has_many :movies, :through => :user_movies

  validates :email, :uniqueness => true

  def self.users_for(notify_day = 0)
    movie_list = Movie.includes(:users).movies_released(notify_day)
    movie_list.map{|movie| movie.users}.flatten.uniq
    # includes UserMovie.where(:movie_id => movie_list)
    #SELECT MOVIEUSERS WHERE the movie_id includes list of movies 
    #- GROUP BY USER ID PICK FIRST ONE

    # movie_list.collect(&:users).uniq(&:name).flatten
    #condense into a database query
    #users that have at least one movie that's coming out on day
  #   movie_list.collect do |movie|
  #     movie.users.collect(&:email)
  #   end.flatten.uniq
  end

end
