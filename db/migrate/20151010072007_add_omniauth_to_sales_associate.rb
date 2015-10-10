class AddOmniauthToSalesAssociate < ActiveRecord::Migration
  def change
    add_column :sales_associates, :provider, :string
    add_index :sales_associates, :provider
    add_column :sales_associates, :uid, :string
    add_index :sales_associates, :uid
  end
end
