class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.integer :code
      t.string :shortname

      t.timestamps
    end
  end
end
