class AddTimetableToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :monday, :boolean
    add_column :positions, :tuesday, :boolean
    add_column :positions, :wednesday, :boolean
    add_column :positions, :thursday, :boolean
    add_column :positions, :friday, :boolean
    add_column :positions, :saturday, :boolean
    add_column :positions, :sunday, :boolean
    add_column :positions, :monday_start, :string
    add_column :positions, :monday_end, :string
    add_column :positions, :tuesday_start, :string
    add_column :positions, :tuesday_end, :string
    add_column :positions, :wednesday_start, :string
    add_column :positions, :wednesday_end, :string
    add_column :positions, :thursday_start, :string
    add_column :positions, :thursday_end, :string
    add_column :positions, :friday_start, :string
    add_column :positions, :friday_end, :string
    add_column :positions, :saturday_start, :string
    add_column :positions, :saturday_end, :string
    add_column :positions, :sunday_start, :string
    add_column :positions, :sunday_end, :string
  end
end
