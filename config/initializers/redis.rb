#Redis.current = Redis.new(:host => ENV["REDIS_HOST"], :port => ENV["REDIS_PORT"])
Redis.current = Redis.new(:host => "192.168.1.237", :port => 6379)

OFFICES = JSON.parse(Redis.current.get("offices"))
CREDITS_PURPOSES = JSON.parse(Redis.current.get("credit_purposes"))
CREDITS_PRODUCTS = JSON.parse(Redis.current.get("credit_products"))
DEPOSITS_PRODUCTS = JSON.parse(Redis.current.get("deposit_products"))
