class Users::MoviesController < ApplicationController

  def create
    UserMovie.create(:user_id => params[:user_id], :movie_id => params[:movie_id])
    redirect_to user_path(params[:user_id])
  end

end
