class Brand < ActiveRecord::Base
   validates :name, :speciality, presence: true, uniqueness: true
  has_many :store_brands
  has_many :stores, through: :store_brands
end
# == Schema Information
#
# Table name: brands
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

