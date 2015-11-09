class SalesAssociateLanguage < ActiveRecord::Base
  belongs_to :language
  belongs_to :sales_associate, class_name: "User", foreign_key: "user_id"
end
# == Schema Information
#
# Table name: sales_associate_languages
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  language_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

