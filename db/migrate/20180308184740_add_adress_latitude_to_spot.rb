class AddAdressLatitudeToSpot < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :adress_latitude, :float
  end
end
