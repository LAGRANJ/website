class AddInPercentColumnToTransferCommissions < ActiveRecord::Migration[5.0]
  def change
    add_column :transfer_commissions, :in_percent, :boolean
  end
end
