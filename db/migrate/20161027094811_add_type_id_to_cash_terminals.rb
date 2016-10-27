class AddTypeIdToCashTerminals < ActiveRecord::Migration[5.0]
  def change
    add_column :cash_terminals, :type_id, :int
  end
end
