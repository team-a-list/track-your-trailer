class Users::MoviesController < ApplicationController

  def create
    UserMovie.create(:user_id => params[:user_id], :movie_id => params[:movie_id])
    redirect_to user_path(params[:user_id])
  end

  def destroy
    @user_movie = UserMovie.where(:user_id => params[:user_id], :movie_id => params[:id])
    UserMovie.destroy(@user_movie)

    redirect_to :back
  end

end
