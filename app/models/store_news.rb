class StoreNews < ActiveRecord::Base
  default_scope { order("created_at desc") }
  belongs_to :store
  validates :content, presence: true
end
# == Schema Information
#
# Table name: store_news
#
#  id         :integer(4)      not null, primary key
#  store_id   :integer(4)
#  content    :text(65535)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

