
class Cart
  extend RedisSupport

  attr_accessor :user_id, :objs

  def initialize(user_id)
    @user_id = user_id
    @objs = []
  end

  def items
    self.objs.flatten
  end

  def sum
    items.inject(0) { |sum, i| sum + Product.find(i['product_id']).price * i['qty'].to_f }
  end

  def with_json_items(items)
    with_items(JSON.parse(items))
  end

  def with_items(items_to_add)
    has_copy = false
    @objs.flatten.map do |item|
      item['qty'] = add_sum(item, items_to_add) if is_in_cart?(item, items_to_add)
      has_copy = true if is_in_cart?(item, items_to_add)
      item
    end
    @objs << items_to_add if has_copy == false
    self
  end

  def self.get(user_id)
    items = redis.get(user_id)
    if items
      Cart.new(user_id).with_json_items(items)
    else
      Cart.new(user_id)
    end
  end

  def self.move_to(user_id, user)
    Cart.redis.rename(user_id, user)
    Cart.redis.del(user_id)
  end

  def save
    Cart.redis.set(user_id, self.objs.to_json)
    self.objs.to_json
  end

  private
  def add_sum(item_in_cart, item_to_add)
    (item_in_cart['qty'].to_i + item_to_add['qty'].to_i).to_s
  end

  def is_in_cart?(item_in_cart, item_to_add)
    item_in_cart['property'] == item_to_add['property'].to_h && item_in_cart['product_id'] == item_to_add['product_id']
  end
end
