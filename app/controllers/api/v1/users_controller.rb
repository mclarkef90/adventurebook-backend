class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy, :show]

  def index
    users= User.all
    options = {
      include: [:adventures, :reviews]
    }
    render json: UserSerializer.new(users, options)
  end

  def create
    user= User.new(user_params)
    if user.save
      render json: user, status: :accepted
    else
      render json: {errors: user.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def update
    @user.update(user_params)
    if user.save
      render json: @user, status: :accepted
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def destroy
    if @user
      @user.delete
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def show
    if @user
      options = {
        include: [:adventures, :reviews]
      }
      render json: UserSerializer.new(@user, options)
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessible_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :biography, :profile_img)
  end

  def set_user
    @user= User.find_by(id: params[:id])
  end

end
