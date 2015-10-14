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
      t.string :monday_start
      t.string :monday_end
      t.string :tuesday_start
      t.string :tuesday_end
      t.string :wednesday_start
      t.string :wednesday_end
      t.string :thursday_start
      t.string :thursday_end
      t.string :friday_start
      t.string :friday_end
      t.string :saturday_start
      t.string :saturday_end
      t.string :sunday_start
      t.string :sunday_end

      t.timestamps null: false
    end
  end
end
