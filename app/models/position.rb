class Position < ActiveRecord::Base
  belongs_to :sales_associate
  belongs_to :store

  validates :start_date, presence: true
end
