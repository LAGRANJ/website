class WebSupportController < ApplicationController
  def send_message
  	ActionCable.server.broadcast "room_channel_#{params[:uuid]}", message: "#{params[:message]}"
  end
end
