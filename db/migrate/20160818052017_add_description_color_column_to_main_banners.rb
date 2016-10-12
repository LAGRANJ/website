class AddDescriptionColorColumnToMainBanners < ActiveRecord::Migration[5.0]
  def change
    add_column :main_banners, :description, :string
  end
end
