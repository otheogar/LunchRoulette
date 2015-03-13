class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|

      t.integer :user_id
      t.date :start_date
      t.string :department
      t.integer :floor
      t.string :last_name
      t.string :first_name
      t.timestamps
    end

    add_index :user_profiles, :user_id, unique: :true
  end
end
