class AddEnabledDescriptionTextColorCaptionColorToSpecialOffers < ActiveRecord::Migration[5.0]
  def change
  	add_column :special_offers, :enabled, :boolean
  	add_column :special_offers, :description_text_color, :string
  	add_column :special_offers, :caption_text_color, :string  	
  end
end
