
class Cart
  extend RedisSupport

  attr_accessor :user_id, :items

  def initialize(user_id)
    @user_id = user_id
    @items = []
  end

  def with_json_items(items)
    with_items(JSON.parse(items))
  end

  def with_items(items_to_add)
    has_copy = false
    @items.flatten.map do |item|
      item['qty'] = add_sum(item, items_to_add) if is_in_cart?(item, items_to_add)
      has_copy = true if is_in_cart?(item, items_to_add)
      item
    end

    @items << items_to_add.first if has_copy == false
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

  def save
    Cart.redis.set(user_id, self.items.to_json)
    self.items.to_json
  end

  private
  def add_sum(item_in_cart, item_to_add)
    (item_in_cart['qty'].to_i + item_to_add.first['qty'].to_i).to_s
  end

  def is_in_cart?(item_in_cart, item_to_add)
    item_in_cart['property'] == item_to_add.first['property'] && item_in_cart['product_id'] == item_to_add.first['product_id']
  end
end
