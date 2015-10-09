class AddRoleToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :role, :string
  end
end
