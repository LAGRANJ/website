class CreateDepositTypeDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :deposit_type_details do |t|
      t.integer :product_id
      t.text :full_description
      t.string :image_ulr

      t.timestamps
    end
  end
end
