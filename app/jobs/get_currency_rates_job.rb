class GetCurrencyRatesJob < ApplicationJob
  queue_as :urgent

  def perform(uuid, message)    
    redis = Redis.new(:host => "192.168.1.241", :port => 6379)
    redis.publish 'rubyonrails', {'msg' => "message from #{uuid}:#{message}"}.to_json
  end
end
