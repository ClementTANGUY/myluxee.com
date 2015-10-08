class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :address
      t.string :state
      t.string :city
      t.integer :zip_code
      t.string :country
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.time :monday_start
      t.time :monday_end
      t.time :tuesday_start
      t.time :tuesday_end
      t.time :wednesday_start
      t.time :wednesday_end
      t.time :thursday_start
      t.time :thursday_end
      t.time :friday_start
      t.time :friday_end
      t.time :saturday_start
      t.time :saturday_end
      t.time :sunday_start
      t.time :sunday_end

      t.timestamps null: false
    end
  end
end
