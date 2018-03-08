class AddAdressLongitudeToSpot < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :adress_longitude, :float
  end
end
