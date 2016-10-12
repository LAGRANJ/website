class AddEnabledColumnToMainBanners < ActiveRecord::Migration[5.0]
  def change
    add_column :main_banners, :enabled, :bool
  end
end
