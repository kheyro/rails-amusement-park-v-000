class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def home
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  def is_admin?
    current_user.admin?
  end

  private

  def required_logged_in
    redirect_to :root unless current_user
  end

  def required_admin
    redirect_to :root unless is_admin?
  end
end
