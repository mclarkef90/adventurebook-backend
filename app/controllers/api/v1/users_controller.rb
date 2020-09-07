class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy, :show]

  def login
    user= User.find_by(email: params[:email])
    if user
      render json: UserSerializer.new(user)
    else
      render json: {errors: "Incorrect Login"}, status: :unprocessible_entity
    end
  end

  def topUser
    mostReviewed= Review.top_user
    adventure= mostReviewed.adventure
    user= adventure.user
    render json: user
  end

  def index
    users= User.all
    render json: UserSerializer.new(users)
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
    if @user.save
      render json: @user, status: :accepted
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def destroy
    if @user
      @user.delete
      render json: user
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
