class CreateAvailablities < ActiveRecord::Migration
  def change
    create_table :availablities do |t|

      t.integer :user_profile_id
      t.date :day
      t.timestamps
    end
  end
end
