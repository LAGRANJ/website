class FixProductIdColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :deposit_type_details, :product_id, :type_id
  end
end
