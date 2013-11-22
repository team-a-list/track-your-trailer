class UsersController < ApplicationController

  # skip_before_action :login_required, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      TwilioApi.welcome_text(user)
      login(user.id)
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  def index
    # if admin
    @users = User.all
  end

  def show
    if params[:id].to_i == current_user.id
      @user = User.find(params[:id])
    else
      redirect_to root_path, :notice => "You aren't that user!"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number)
  end
end
