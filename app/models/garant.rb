class Garant < ApplicationRecord
	has_many :garant_details
	has_many :garant_images
end
