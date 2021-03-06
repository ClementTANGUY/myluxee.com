class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :store
      t.references :user
      t.date :start_date
      t.date :end_date
      t.timestamps null: false
    end

    add_foreign_key :positions, :stores
    add_foreign_key :positions, :users
  end
end
