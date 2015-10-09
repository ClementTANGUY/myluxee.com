class StoreBrand < ActiveRecord::Base
  belongs_to :store
  belongs_to :brand
end
# == Schema Information
#
# Table name: store_brands
#
#  id         :integer(4)      not null, primary key
#  brand_id   :integer(4)
#  store_id   :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

