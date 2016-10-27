class CreateGarantImages < ActiveRecord::Migration[5.0]
  def change
    create_table :garant_images do |t|
      t.string :image_path
      t.belongs_to :garant
      t.timestamps
    end
  end
end
