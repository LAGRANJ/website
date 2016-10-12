class AddPriorityColumnToMainBanners < ActiveRecord::Migration[5.0]
  def change
    add_column :main_banners, :priority, :integer
  end
end
