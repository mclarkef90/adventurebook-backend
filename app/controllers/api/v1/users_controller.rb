class API::V1::UsersController < ApplicationController

  def index
    users= User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :biography, :profile_img)
  end

end
