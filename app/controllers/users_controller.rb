class UsersController < ApplicationController

  def index
    # if admin
    @users = User.all
    redirect_to root_path
  end

  def show
    if params[:id].to_i == current_user.id
      @user = User.find(params[:id])
    else
      redirect_to root_path, :notice => "You aren't that user!"
    end
  end

end
