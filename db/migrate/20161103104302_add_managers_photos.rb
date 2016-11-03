class AddManagersPhotos < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :managers, :photo
  end
end
