class CreateOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :offices do |t|
      t.integer :lon
      t.integer :lat

      t.timestamps
    end
  end
end
