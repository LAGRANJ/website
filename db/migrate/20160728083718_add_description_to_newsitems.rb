class AddDescriptionToNewsitems < ActiveRecord::Migration[5.0]
  def change
    add_column :newsitems, :description, :text
  end
end
