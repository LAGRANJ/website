#Redis.current = Redis.new(:host => ENV["REDIS_HOST"], :port => ENV["REDIS_PORT"])
Redis.current = Redis.new(:host => "176.126.167.105", :port => 6379)

OFFICES = JSON.parse(Redis.current.get("offices"))
CREDITS_PURPOSES = JSON.parse(Redis.current.get("credit_purposes"))
CREDITS_PRODUCTS = JSON.parse(Redis.current.get("credit_products"))
DEPOSITS_PRODUCTS = JSON.parse(Redis.current.get("deposit_products"))
