class CartController < ApplicationController

  def index
  end

  def create
    begin
      @cart = cart_params
      id = cart_cookie(id: 'cart', value: SecureRandom.hex)
      mycart = Cart.get(id).with_items(cart_params)
      mycart.save
      render action: :index
    rescue
      redirect_to cart_path
    end
  end

  protected
  def cart_params
    params.require(:cart).require(:product_id)
    params.require(:cart).require(:qty)
    params.require(:cart).require(:property)
    params.require(:cart).permit(:product_id, :qty, :property => ['Tamanho', 'Cor', 'Tipo'])
  end

  def cookie_exists?(id: )
    !cookies[id].nil?
  end

  def cart_cookie(id:, value:)
    unless cookie_exists?(id: 'cart')
      cookies[id] = { value: value, expires: 20.days.from_now, httponly: true }
      value
    else
      cookies[]
    end
  end
end
