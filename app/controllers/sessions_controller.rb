class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    path = return_path
    set_return_path(nil)
    redirect_to path
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
