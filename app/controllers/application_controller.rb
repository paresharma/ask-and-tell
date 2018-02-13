class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login_required
    return if current_user
    set_return_path(request.url) if request.get?
    redirect_to new_session_path, notice: 'Login to continue'
  end

  def return_path
    session[:return_path] || root_path
  end

  def set_return_path(path)
    session[:return_path] = path
  end
end
