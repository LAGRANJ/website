class AddColumnsOffices < ActiveRecord::Migration[5.0]
  def change
    add_column :offices, :officeid, :integer
  end
end
