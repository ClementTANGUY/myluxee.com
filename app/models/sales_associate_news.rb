class SalesAssociateNews < ActiveRecord::Base
  default_scope { order("created_at desc") }
  validates :content, presence: true

  belongs_to :sales_associate, class_name: "User", foreign_key: "user_id"

end
# == Schema Information
#
# Table name: sales_associate_news
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  content    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

