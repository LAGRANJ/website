class CreateCurrencyRates < ActiveRecord::Migration[5.0]
  def change
    create_table :currency_rates do |t|
      t.integer :currencyid
      t.integer :officeid
      t.datetime :ratedate
      t.decimal :sellrate, precision:5, scale:2
      t.decimal :buyrate, precision:5, scale:2

      t.timestamps
    end
  end
end
