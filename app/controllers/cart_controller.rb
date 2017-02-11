class CartController < ApplicationController

  def index
  end

  def create
    @cart = cart_params
    mycart = get_cart(1).with_items(cart_params)
    mycart.save
    render action: :index
  end

  protected
  def cart_params
    params.permit(:product_id, :qty, :property => ['Tamanho', 'Cor', 'Tipo'])
  end

  def get_cart(user_id)
    items = redis.get(user_id)
    if items
      Cart.new(user_id: user_id).with_json_items(items)
    else
      Cart.new(user_id: user_id)
    end
  end
end
