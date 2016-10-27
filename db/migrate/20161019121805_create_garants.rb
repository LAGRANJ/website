class CreateGarants < ActiveRecord::Migration[5.0]
  def change
    create_table :garants do |t|
      t.string :name
      t.string :description
      t.decimal :cost
      t.string :region
      t.string :phone
      t.timestamps
    end
  end
end
