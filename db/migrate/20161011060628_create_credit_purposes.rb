class CreateCreditPurposes < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_purposes do |t|
      t.integer :purpose_id
      t.string :image_path
      t.decimal :min_rate
      t.string :description
      t.timestamps
    end
  end
end
