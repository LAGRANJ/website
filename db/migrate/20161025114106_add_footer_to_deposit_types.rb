class AddFooterToDepositTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :deposit_types, :footer, :string
  end
end
