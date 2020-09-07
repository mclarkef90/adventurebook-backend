class Api::V1::ReviewsController < ApplicationController
  before_action :set_review, only: [:update, :destroy, :show]

  def tops
    mostReviewed= Review.top_user
    adventure= mostReviewed.adventure
    user= adventure.user

    topadventure= Adventure.top_adventure
    render json: [topadventure, user]

  end

  def index
    reviews= Review.all

    render json: ReviewSerializer.new(reviews)
  end

  def create
    review= Review.new(review_params)
    if adventure.save
      render json: review, status: :accepted
    else
      render json: {errors: review.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def update
    @review.update(review_params)
    if @review.save
      render json: @review, status: :accepted
    else
      render json: {errors: @review.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def destroy
    if @review
      @review.delete
    else
      render json: {errors: @review.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def show
    if @review
      options = {
        include: [:user, :adventure]
      }
      render json: ReviewSerializer.new(@review, options)
    else
      render json: {errors: @review.errors.full_messages}, status: :unprocessible_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :adventure_id, :comment, :liked, :completed)
  end

  def set_review
    @review= Review.find_by(id: params[:id])
  end

end
