class CreateCashTerminals < ActiveRecord::Migration[5.0]
  def change
    create_table :cash_terminals do |t|
      t.string :name
      t.string :address
      t.string :terminal_type
      t.string :workdays
      t.string :currencies
      t.decimal :lon
      t.decimal :lat

      t.timestamps
    end
  end
end
