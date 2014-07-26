class UsersController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:verify_text]

  def index
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

  def verify_text
    user = User.find_by(:text_token => params[:text_token])
    user.update(
      :text_token => nil,
      :phone_verified => true
    )
    redirect_to root_path
  end

end
