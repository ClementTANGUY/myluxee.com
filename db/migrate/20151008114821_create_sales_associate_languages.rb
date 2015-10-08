class CreateSalesAssociateLanguages < ActiveRecord::Migration
  def change
    create_table :sales_associate_languages do |t|
      t.references :sales_associate
      t.references :language
      t.timestamps null: false
    end

    add_foreign_key :sales_associate_languages, :sales_associates
    add_foreign_key :sales_associate_languages, :languages
  end
end
