class CreateSalesAssociates < ActiveRecord::Migration
  def change
    create_table :sales_associates do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :be_contacted
      t.boolean :be_rated

      t.timestamps null: false
    end
  end
end
