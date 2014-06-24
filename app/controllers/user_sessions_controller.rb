class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email:params[:email]

    if user and user.authenticate(params[:password])
      set_current_user(user)
      redirect_to root_path
    else
      flash[:error] = "Invalid credentials"
      redirect_to login_path
    end
  end

end