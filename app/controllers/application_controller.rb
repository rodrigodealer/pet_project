class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redis
    Redis.new(:host => 'localhost', :port => 6379)
  end
end
