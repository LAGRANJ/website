class AddTypeIdToCurrencyRates < ActiveRecord::Migration[5.0]
  def change
    add_column :currency_rates, :typeid, :integer
  end
end
