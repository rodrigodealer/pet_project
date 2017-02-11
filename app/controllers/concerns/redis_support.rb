module RedisSupport

  def redis
    Redis.new(:host => 'localhost', :port => 6379)
  end
end
