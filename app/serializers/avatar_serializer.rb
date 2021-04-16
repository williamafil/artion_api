class AvatarSerializer
  def initialize(avatar: nil, user:)
    @avatar = avatar
    @user = user
  end

  def serialize_new_avatar()
    serialize_new_avatar = serialize_avatar(@avatar, @user)
    serialize_new_avatar.to_json()
  end

  private

  def serialize_avatar(avatar, user)
    {
      user_id: user.id,
      avatar: user.avatar_url(),
      created_at: user.created_at
    }
  end
end