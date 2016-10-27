class AddFullImageUrlToGarantImages < ActiveRecord::Migration[5.0]
  def change
    add_column :garant_images, :full_image_path, :string
  end
end
