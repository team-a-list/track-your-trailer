class MoviesController < ApplicationController

  def index
    @movies = Movie.order(release_date_theater: :desc).limit(10)
  end

  def all_movies
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
