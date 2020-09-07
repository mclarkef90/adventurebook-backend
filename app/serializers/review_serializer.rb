class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :comment, :liked, :completed, :user_id, :adventure_id
  belongs_to :user
  belongs_to :adventure
end
