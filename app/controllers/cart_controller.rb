class CartController < ApplicationController

  def index
  end

  def create
    begin
      @cart = cart_params
      mycart = Cart.get_cart(1).with_items(cart_params)
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
end
