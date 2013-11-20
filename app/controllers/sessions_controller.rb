class SessionsController < ApplicationController

  skip_before_action :login_required, :only => [:new, :create]

  def new
  end

  def create
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      login(user.id)
      redirect_to(root_path)
    else 
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to(root_path)
  end

end
