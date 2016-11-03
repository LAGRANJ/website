class CreateManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :managers do |t|
      t.string :fullname
      t.string :title
      t.date :dateofbirth
      t.string :biography
      t.string :addresstoclients

      t.timestamps
    end
  end
end
