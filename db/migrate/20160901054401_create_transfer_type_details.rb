class CreateTransferTypeDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :transfer_type_details do |t|
      t.integer :typeid
      t.string :url
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
