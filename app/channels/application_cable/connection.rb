module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :uuid
  	def connect
  		self.uuid = cookies[:userid];
  		logger.debug("write userid:#{cookies[:userid]}");
  	end
  end
end
