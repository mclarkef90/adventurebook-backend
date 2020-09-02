class Review < ApplicationRecord
  belongs_to :user
  belongs_to :adventure

  def self.top_user
    Review.where(liked: true).order(:adventure_id).max
  end

end
