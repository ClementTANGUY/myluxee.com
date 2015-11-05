class CreateStoreBrands < ActiveRecord::Migration
  def change
    create_table :store_brands do |t|
      t.references :brand
      t.references :store
      t.timestamps null: false
    end
    add_foreign_key :store_brands, :brands
    add_foreign_key :store_brands, :stores
  end
end
