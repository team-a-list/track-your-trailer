class User < ActiveRecord::Base
  has_many :user_movies
  has_many :movies, :through => :user_movies

  has_secure_password

  phony_normalize :phone_number, :default_country_code => "US"

  # before_validation :normalize_phone

  validates :email, :uniqueness => true
  # validates_format_of :phone_number, :with => /\A\+\d{11}\z/

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

  def text_notification(notify_day)
    self.movie_notifications(notify_day).collect(&:name).to_sentence[0..140]
  end

  # def normalize_phone
  #   self.phone_number = "+1" + read_attribute(:phone_number).gsub(/\D/,"")
  # end

end