require 'redis'
class MainController < ApplicationController
  def index
  	@mainnewsitem = Newsitem.where(priority:0).first
    @newsitems = Newsitem.where(priority:1)
    @records = ActiveRecord::Base.connection.execute("select * from get_currency_rates(840)")
    redis = Redis.new
    redis = Redis.new(:host => "192.168.1.241", :port => 6379, :password => '12345')
    @redis_message = redis.get("test")
  end
end
