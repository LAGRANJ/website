class ChangeColumnSellRateInCurrencyRates < ActiveRecord::Migration[5.0]
  def change
  	change_column :currency_rates, :sellrate, :decimal, :precision=>10, :scale=>4
  	change_column :currency_rates, :buyrate, :decimal, :precision=>10, :scale=>4
  end
end
