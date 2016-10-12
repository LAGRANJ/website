class AddCaptionColorColumnToMainBanners < ActiveRecord::Migration[5.0]
  def change
    add_column :main_banners, :color, :string
  end
end
