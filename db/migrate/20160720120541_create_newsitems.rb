class CreateNewsitems < ActiveRecord::Migration[5.0]
  def change
    create_table :newsitems do |t|
      t.text :caption
      t.text :body
      t.date :creation_date
      t.integer :priority

      t.timestamps
    end
  end
end
