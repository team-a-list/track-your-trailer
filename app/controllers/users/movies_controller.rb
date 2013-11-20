class Users::MoviesController < ApplicationController

  def create
    if params[:user_id].to_i == @current_user.id
      UserMovie.find_or_create_by(:user_id => params[:user_id], :movie_id => params[:movie_id])
      redirect_to user_path(params[:user_id])
    else
      redirect_to :back, :notice => "You can't add a movie to another user!"
    end
  end

  def destroy
    @user_movie = UserMovie.where(:user_id => params[:user_id], :movie_id => params[:id])
    UserMovie.destroy(@user_movie)

    redirect_to :back
  end

end