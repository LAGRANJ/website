class CreateTransferCommissions < ActiveRecord::Migration[5.0]
  def change
    create_table :transfer_commissions do |t|
      t.integer :typeid
      t.integer :currencyid
      t.integer :countryid
      t.decimal :minsum
      t.decimal :maxsum
      t.decimal :commission

      t.timestamps
    end
  end
end
