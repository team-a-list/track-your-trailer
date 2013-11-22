class MoviesController < ApplicationController

  def index
    @movies = Movie.where("release_date_theater is not null").order(release_date_theater: :desc).limit(10)
    @first_movie = @movies.first
    @other_movies = @movies[1..-1]
  end

  def all_movies
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
