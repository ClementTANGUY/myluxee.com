class AddForeingKeyToSalesAssociateNews < ActiveRecord::Migration
  def change
    add_foreign_key :sales_associate_news, :users
  end
end
