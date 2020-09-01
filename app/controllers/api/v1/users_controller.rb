class Api::V1::UsersController < ApplicationController

  def index
    users= User.all
    options = {
    include: [:adventures, :reviews]
  }
    render json: UserSerializer.new(users, options)

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :biography, :profile_img)
  end

end
