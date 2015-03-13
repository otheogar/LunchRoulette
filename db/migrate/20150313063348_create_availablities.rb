class CreateAvailablities < ActiveRecord::Migration
  def change
    create_table :availablities do |t|

      t.date :day
      t.timestamps
    end
  end
end
