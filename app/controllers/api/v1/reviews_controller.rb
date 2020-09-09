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
    if review.save
      adventure= Adventure.find_by(id: params[:adventure_id])
      adventure.increaseLikes(review)
      adventure.increaseCompletions(review)
      render json: {review: ReviewSerializer.new(review), adventure: AdventureSerializer.new(adventure)}, status: :accepted
    else
      render json: {errors: review.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def update
    id= @review.id
    @preUpdate = Review.find_by(id: id)
    adventureId= @review.adventure_id
    adventure= Adventure.find_by(id: adventureId)
    adventure.decreaseLikes(@preUpdate)
    adventure.decreaseCompletions(@preUpdate)

    @review.update(review_params)
    adventure.increaseLikes(@review)
    adventure.increaseCompletions(@review)

    if @review.save
        render json: {review: ReviewSerializer.new(@review), adventure: AdventureSerializer.new(adventure)}, status: :accepted
    else
      render json: {errors: @review.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def destroy
    if @review
      @review.delete
      adventureId= @review.adventure_id
      adventure= Adventure.find_by(id: adventureId)
      adventure.decreaseLikes(@review)
      adventure.decreaseCompletions(@review)
      userId= @review.user_id
      user= User.find_by(id: userId)
      render json: {review: ReviewSerializer.new(@review), adventure: AdventureSerializer.new(adventure), user: UserSerializer.new(user)}, status: :accepted
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
