class CartController < ApplicationController
  include Cookies
  # before_action :validate_logged_user

  def index
    Cart.move_to(cookies['cart'], current_user.uuid) if has_anonymous_cart?
    value = cart_cookie(id: 'cart', value: SecureRandom.uuid)
    @cart = Cart.get(value)
    @items = Cart.get(value).items.map do |i|
      i['product'] = Product.find(i['product_id'])
      i
    end
  end

  def create
    begin
      @cart = Cart.get(cart_cookie(id: 'cart', value: SecureRandom.uuid))
                  .with_items(cart_params)
                  .save
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
end
