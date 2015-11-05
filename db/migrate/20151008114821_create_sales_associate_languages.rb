class CreateSalesAssociateLanguages < ActiveRecord::Migration
  def change
    create_table :sales_associate_languages do |t|
      t.references :user
      t.references :language
      t.timestamps null: false
    end

    add_foreign_key :sales_associate_languages, :users
    add_foreign_key :sales_associate_languages, :languages
  end
end
