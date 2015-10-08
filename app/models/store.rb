class Store < ActiveRecord::Base
  validates :address, :state, :city, :zip_code, :country, presence:true

  has_one :store_brand, dependent: :destroy
  has_one :brand, through: :store_brand

  has_many :positions, ->{where('end_date is null')}
  has_many :sales_associates, through: :positions
end
