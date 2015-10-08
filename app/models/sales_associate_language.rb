class SalesAssociateLanguage < ActiveRecord::Base
  belongs_to :language
  belongs_to :sales_associate
end
