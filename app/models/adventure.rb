class Adventure < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  validates :title, :description, :image_url, presence: true

  def self.top_adventure
    all.order(likes: :desc).limit(1)
  end

  def increaseLikes(review)
    if review.liked == true
      self.likes += 1
      self.save
    end
  end

  def increaseCompletions(review)
    if review.completed == true
      self.completions +=1
      self.save
    end
  end

  def decreaseLikes(review)
    if review.liked == true
      self.likes -= 1
      self.save
    end
  end

  def decreaseCompletions(review)
    if review.completed == true
      self.completions -= 1
      self.save
    end
  end


end
