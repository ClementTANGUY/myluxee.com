class SalesAssociateLanguage < ActiveRecord::Base
  belongs_to :language
  belongs_to :sales_associate, class_name: "User", foreign_key: "user_id"
end
# == Schema Information
#
# Table name: sales_associate_languages
#
#  id                 :integer(4)      not null, primary key
#  sales_associate_id :integer(4)
#  language_id        :integer(4)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

