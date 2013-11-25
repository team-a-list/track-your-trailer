class MoviesController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index, :all_movies, :show]

  def index
    @movies = Movie.where.not(poster_image: "http://images.rottentomatoescdn.com/images/redesign/poster_default.gif").where("release_date_theater is not null").order(release_date_theater: :desc).limit(9).reverse
  end

  def all_movies
    @movies = Movie.all.where.not(poster_image: "http://images.rottentomatoescdn.com/images/redesign/poster_default.gif").where("release_date_theater > ? or release_date_dvd > ?", Time.now, Time.now)
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
