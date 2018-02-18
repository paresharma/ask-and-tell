# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def login_required
    return if current_user
    store_return_path_in_session(request.url) if request.get?
    redirect_to new_session_path, notice: 'Login to continue'
  end

  def return_path
    session[:return_path] || root_path
  end

  def store_return_path_in_session(path)
    session[:return_path] = path
  end
end
