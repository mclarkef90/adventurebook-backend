class User < ApplicationRecord
  has_secure_password
  has_many :adventures, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :username, :email, :profile_img, presence: true
  validates :email, uniqueness: true
end
