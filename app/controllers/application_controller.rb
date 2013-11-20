class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :login_required

  def authorized?(id)
    
  end

  def login_required
    if !user_logged_in?
      redirect_to login_path
    end
  end

  def user_logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login(id)
    session[:user_id] = id
  end

end
