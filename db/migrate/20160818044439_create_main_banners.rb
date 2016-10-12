class CreateMainBanners < ActiveRecord::Migration[5.0]
  def change
    create_table :main_banners do |t|
      t.string :caption
      t.string :url
      t.string :imgpath

      t.timestamps
    end
  end
end
