class FixImageUrlColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :deposit_type_details, :image_ulr, :image_url
  end
end
