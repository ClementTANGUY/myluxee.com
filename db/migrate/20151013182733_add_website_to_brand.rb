class AddWebsiteToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :website, :string
  end
end
