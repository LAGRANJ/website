class AlterColumnOfficesLatLon < ActiveRecord::Migration[5.0]
  def change
  	change_column :offices, :lon, :decimal
  	change_column :offices, :lat, :decimal
  	add_column :offices, :workdays, :string
  	add_column :offices, :workhours, :string  	
  	add_column :offices, :lunchtime, :string
  end
end
