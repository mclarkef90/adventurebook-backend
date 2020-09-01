class AdventureSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :image_url, :likes, :completions
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
end
