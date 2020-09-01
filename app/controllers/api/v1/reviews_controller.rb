class API::V1::ReviewsController < ApplicationController

  def index
    reviews= Review.all
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :adventure_id, :comment, :liked, :completed)
  end
end
