class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :biography, :profile_img
  has_many :adventures
  has_many :reviews
  has_many :adventures, through: :reviews
end
