class AddImagePathToSpecialOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :special_offers, :image_path, :string
  end
end
