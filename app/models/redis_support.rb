class RedisSupport
  def self.redis
    Redis.new(:host => 'localhost', :port => 6379)
  end
end
