class Users::MoviesController < ApplicationController

  def create
    UserMovie.find_or_create_by(:user_id => params[:user_id], :movie_id => params[:movie_id])
    redirect_to user_path(params[:user_id])
  end

  def destroy
    @user_movie = UserMovie.where(:user_id => params[:user_id], :movie_id => params[:id])
    UserMovie.destroy(@user_movie)

    redirect_to :back
  end

end

# UserMovie.all.each do |notification|
#   if notification.not_sent?
#     ActionMailerGuy::send(:to => notification.user.email, :msg => "#{notification.movie.name} is coming out soon!")
#     notification.sent = true
#   end
# end