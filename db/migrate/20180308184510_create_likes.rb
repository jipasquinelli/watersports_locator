class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :photo_id
      t.integer :spot_id

      t.timestamps

    end
  end
end
