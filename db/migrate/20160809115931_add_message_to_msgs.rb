class AddMessageToMsgs < ActiveRecord::Migration[5.0]
  def change
    add_column :msgs, :message, :text
  end
end
