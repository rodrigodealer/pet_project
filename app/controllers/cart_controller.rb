class CartController < ApplicationController
  include Cookies

  def index
    id = cart_cookie(id: 'cart', value: SecureRandom.uuid)
    @cart = Cart.get(id)
  end

  def create
    begin
      id = cart_cookie(id: 'cart', value: SecureRandom.uuid)
      @cart = Cart.get(current_user.uuid)
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
