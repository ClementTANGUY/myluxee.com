class Language < ActiveRecord::Base
  default_scope { order("name") }

  validates :name, presence:  true, uniqueness: true

  has_many :sales_associate_languages
  has_many :sales_associates, through: :sales_associate_languages
end
