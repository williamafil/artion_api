class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :created_at, :avatar

  attribute :avatar do |user|
    user.avatar_url()
  end
end
