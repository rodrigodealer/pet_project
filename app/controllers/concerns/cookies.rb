module Cookies
  extend ActiveSupport::Concern

  def has_anonymous_cart?
    current_user && !Cart.get(cookies['cart']).items.empty?
  end

  def cart_cookie(id:, value:)
    if current_user
      current_user.uuid
    else
      if cookies[id].nil?
        cookies[id] = { value: value, expires: 20.days.from_now, httponly: true }
      end
      cookies[id]
    end
  end
end
