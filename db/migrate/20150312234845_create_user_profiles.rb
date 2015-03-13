class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|

      t.date :start_date
      t.string :department
      t.integer :floor
      t.timestamps
    end
  end
end
