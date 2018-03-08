class AddSportCountToSpots < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :sports_count, :integer
  end
end
