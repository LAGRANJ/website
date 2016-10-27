class AddPaperClipToMiniSpecialOffers < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :mini_special_offers, :image
  end
end
