require 'redis'
require 'json'

class MainController < ApplicationController
  def index
    cookies[:userid]=SecureRandom.uuid
    @mainnewsitem = Newsitem.where(priority:0).first    
    @newsitems = Newsitem.where(priority:1).first(5)
    @mainbigbanner = MainBanner.where(enabled: true,priority:0).first    
    @bigbanners = MainBanner.where(enabled: true,priority:1)

    @records = ActiveRecord::Base.connection.execute("select * from get_currency_rates(840)")    
    redis = Redis.new(:host => "192.168.1.241", :port => 6379)
    @redis_message = redis.get("test")
    @currencies = redis.lrange('currencies',0,-1)
    @market_rates_cash = Hash.new()
    @market_rates_noncash = Hash.new()
    @currency_rates = Hash.new()
    @currencies.each do |currencyid|
    	@currency_rates[currencyid] = JSON.parse(redis.get("currencyid:#{currencyid}_3"))
    	@market_rates_noncash[currencyid] = JSON.parse(redis.get("currencyid:#{currencyid}_2"))
    	@market_rates_cash[currencyid] = JSON.parse(redis.get("currencyid:#{currencyid}_1"))
    end
    @dollarrate = JSON.parse(redis.get("currencyid:840_1"));
    @l = lambda {|m| "hello"}
  end
end
