class AddPaperClipToSpecialOffer < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :special_offers, :image
  end
end
