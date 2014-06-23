class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.valid?
      flash[:notice] = "Your account has been succesfully created"
      set_current_user(@user)
      redirect_to root_path
    else
      render "new"
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
