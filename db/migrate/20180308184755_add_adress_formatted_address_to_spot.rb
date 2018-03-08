class AddAdressFormattedAddressToSpot < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :adress_formatted_address, :string
  end
end
