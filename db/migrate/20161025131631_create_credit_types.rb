class CreateCreditTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_types do |t|
      t.integer :type_id
      t.text :description
      t.string :caption
      t.attachment :image
      t.string :footer

      t.timestamps
    end
  end
end
