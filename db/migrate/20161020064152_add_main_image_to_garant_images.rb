class AddMainImageToGarantImages < ActiveRecord::Migration[5.0]
  def change
    add_column :garant_images, :main_image, :boolean
  end
end
