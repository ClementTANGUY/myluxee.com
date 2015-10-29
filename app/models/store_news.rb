class StoreNews < ActiveRecord::Base
  default_scope { order("created_at desc") }
  belongs_to :store
  validates :content, presence: true
end
