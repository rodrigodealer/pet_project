module UsersHelper
  def user_link(user)
    raw("<img src=\"http://graph.facebook.com/#{user.uid}/picture\" height=\"12\" width=\"12\" class=\"user-avatar\" /> #{user.name}")
  end
end
