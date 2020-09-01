class Api::V1::AdventuresController < ApplicationController

  def index
    adventures= Adventure.all
    options = {
    include: [:users, :reviews]
  }
    render json: AdventureSerializer.new(adventures, options)

  end

  private

  def adventure_params
    params.require(:adventure).permit(:title, :description, :image_url, :user_id)
  end

end
