class Brand < ActiveRecord::Base
   validates :name, presence: true, uniqueness: true
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

