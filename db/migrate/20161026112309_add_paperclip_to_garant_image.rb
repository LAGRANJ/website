class AddPaperclipToGarantImage < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :garant_images, :image
  end
end
