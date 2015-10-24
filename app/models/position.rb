class Position < ActiveRecord::Base
  ROLE_LIST = ["Store Manager", "Department Head","Sales Associate", "First Salesman", "Floor Manager"]

  belongs_to :sales_associate
  belongs_to :store

  validates :start_date, :role , presence: true
  validates :sales_associate_id, uniqueness: { scope: :store_id }
end
# == Schema Information
#
# Table name: positions
#
#  id                 :integer(4)      not null, primary key
#  store_id           :integer(4)
#  sales_associate_id :integer(4)
#  start_date         :date
#  end_date           :date
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  role               :string(255)
#

