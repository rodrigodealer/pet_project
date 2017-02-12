
class Cart
  extend RedisSupport

  attr_accessor :user_id, :items

  def initialize(user_id:)
    @user_id = user_id
    @items = []
  end

  def with_json_items(items)
    with_items(JSON.parse(items))
  end

  def with_items(items)
    @items << items
    self
  end

  def self.get(user_id)
    items = redis.get(user_id)
    if items
      Cart.new(user_id: user_id).with_json_items(items)
    else
      Cart.new(user_id: user_id)
    end
  end

  def save
    Cart.redis.set(@user_id, self.items.to_json)
  end
end
