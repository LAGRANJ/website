class CreateGarantDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :garant_details do |t|
      t.string :prop_key
      t.string :prop_value
      t.belongs_to :garant
      t.timestamps
    end
  end
end
