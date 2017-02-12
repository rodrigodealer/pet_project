module Cookies
  extend ActiveSupport::Concern

  def cookie_exists?(id: )
    !cookies[id].nil?
  end

  def cart_cookie(id:, value:)
    unless cookie_exists?(id: 'cart')
      cookies[id] = { value: value, expires: 20.days.from_now, httponly: true }
      value
    else
      cookies[id]
    end
  end
end
