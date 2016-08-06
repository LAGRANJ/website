module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identifed_by :uuid
  	def connect 
  		self.uuid = SecureRandom.uuid
  	end

  end
end
