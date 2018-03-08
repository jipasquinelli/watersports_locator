class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :image
      t.integer :user_id
      t.string :location
      t.integer :spot_id
      t.integer :sport_id

      t.timestamps

    end
  end
end
