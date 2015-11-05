class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :be_contacted
      t.boolean :be_rated
      t.string :contact_email
      t.timestamps null: false
    end
  end
end
