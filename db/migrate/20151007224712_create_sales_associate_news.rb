class CreateSalesAssociateNews < ActiveRecord::Migration
  def change
    create_table :sales_associate_news do |t|
      t.references :user
      t.text :content

      t.timestamps null: false
    end

  end
end
