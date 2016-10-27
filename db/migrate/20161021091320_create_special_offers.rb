class CreateSpecialOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :special_offers do |t|
      t.string :caption
      t.string :description
      t.string :body
      t.date :creation_date
      t.integer :priority

      t.timestamps
    end
  end
end
