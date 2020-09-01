class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :comment, :liked, :completed
  belongs_to :user
  belongs_to :adventure
end
