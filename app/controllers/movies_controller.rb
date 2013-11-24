class MoviesController < ApplicationController

  def index
    @movies = Movie.where.not(poster_image: "http://images.rottentomatoescdn.com/images/redesign/poster_default.gif").where("release_date_theater is not null").order(release_date_theater: :desc).limit(10).order(release_date_theater: :asc)
    @first_movie = @movies.first
    @other_movies = @movies[1..-1]
  end

  def all_movies
    @movies = Movie.all.where.not(poster_image: "http://images.rottentomatoescdn.com/images/redesign/poster_default.gif")
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
