class CreateStoreNews < ActiveRecord::Migration
  def change
    create_table :store_news do |t|
      t.references :store
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :store_news, :stores
  end
end
