class Api::V1::AdventuresController < ApplicationController
  before_action :set_user, only: [:update, :destroy, :show]

  def topAdventure
    adventure= Adventure.top_adventure
    render json: adventure
  end

  def index
    adventures= Adventure.all
    render json: AdventureSerializer.new(adventures)
  end

  def create
    adventure= Adventure.new(adventure_params)
    if adventure.save
      render json: adventure, status: :accepted
    else
      render json: {errors: adventure.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def update
    @adventure.update(adventure_params)
    if @adventure.save
      render json: AdventureSerializer.new(@adventure)
    else
      render json: {errors: @adventure.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def destroy
    if @adventure
      @adventure.delete
    else
      render json: {errors: @adventure.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def show
    if @adventure
      options = {
        include: [:user, :users, :reviews]
      }
      render json: AdventureSerializer.new(@adventure, options)
    else
      render json: {errors: @adventure.errors.full_messages}, status: :unprocessible_entity
    end
  end

  private

  def adventure_params
    params.require(:adventure).permit(:title, :description, :image_url, :user_id, :likes, :completions)
  end

  def set_user
    @adventure= Adventure.find_by(id: params[:id])
  end

end
