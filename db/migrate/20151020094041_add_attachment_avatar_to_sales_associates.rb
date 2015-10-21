class AddAttachmentAvatarToSalesAssociates < ActiveRecord::Migration
  def self.up
    change_table :sales_associates do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :sales_associates, :avatar
  end
end
