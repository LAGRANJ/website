# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{uuid}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	GetCurrencyRatesJob.set(wait: 10.seconds).perform_later(uuid, data['message'])
  	#ActionCable.server.broadcast "room_channel_#{uuid}", message: data['message']
  end
end
