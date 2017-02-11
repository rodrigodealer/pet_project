class Cart
  include ::RedisSupport

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

  def save
    redis.set(@user_id, self.items.to_json)
  end
end
