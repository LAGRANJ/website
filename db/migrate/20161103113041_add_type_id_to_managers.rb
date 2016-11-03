class AddTypeIdToManagers < ActiveRecord::Migration[5.0]
  def change
    add_column :managers, :type_id, :integer
  end
end
