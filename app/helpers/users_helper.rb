module UsersHelper
  def gravatar_for user
    image_tag user.avatar_link? ? user.avatar_link : "default-avatar.png"
  end
end
