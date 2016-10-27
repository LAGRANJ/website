class CreateMiniSpecialOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :mini_special_offers do |t|
      t.string :caption
      t.string :description
      t.string :body
      t.date :creation_date
      t.integer :priority
	  t.string :image_path
	  t.boolean :enabled
  	  t.string :description_text_color
  	  t.string :caption_text_color
      t.timestamps
    end
  end
end
