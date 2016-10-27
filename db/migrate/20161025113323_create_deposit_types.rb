class CreateDepositTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :deposit_types do |t|
      t.integer :type_id
      t.text :description
      t.string :caption
      t.attachment :image
      t.timestamps
    end
  end
end
