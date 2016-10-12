class CreateCountriesofCommissions < ActiveRecord::Migration[5.0]
  def change
    create_table :countriesof_commissions do |t|
      t.integer :countryid
      t.integer :transfer_commission_id
      t.belongs_to :transfer_commission
      t.timestamps
    end
  end
end
