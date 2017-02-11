class CartController < ApplicationController

  def index
  end

  def create
    @cart = cart_params
    mycart = Cart.get_cart(1).with_items(cart_params)
    mycart.save
    render action: :index
  end

  protected
  def cart_params
    params.permit(:product_id, :qty, :property => ['Tamanho', 'Cor', 'Tipo'])
  end
end
