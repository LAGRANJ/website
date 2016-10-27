class AddImageDescriptionToGarantImages < ActiveRecord::Migration[5.0]
  def change
    add_column :garant_images, :image_description, :string
  end
end
