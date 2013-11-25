class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable
  has_many :user_movies
  has_many :movies, :through => :user_movies

  phony_normalize :phone_number, :default_country_code => "US"

  validates_uniqueness_of :email

  after_create :send_text_verification

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

  def send_text_verification
    self.text_token = Random.rand(8999) + 1000
    self.save

    TwilioApi.send_verification(self)
  end

end