class Language < ActiveRecord::Base
  default_scope { order("name") }

  validates :name, presence:  true, uniqueness: true

  has_many :sales_associate_languages
  has_many :sales_associates, through: :sales_associate_languages
end
# == Schema Information
#
# Table name: languages
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

