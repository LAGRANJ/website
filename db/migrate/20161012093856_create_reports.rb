class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :type_id
      t.integer :year
      t.integer :period_id
      t.string :report_path

      t.timestamps
    end
  end
end
