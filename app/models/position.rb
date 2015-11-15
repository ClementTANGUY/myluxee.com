class Position < ActiveRecord::Base
  ROLE_LIST = ["Store Manager", "Department Head","Sales Associate", "First Salesman", "Floor Manager"]

  belongs_to :sales_associate, class_name: "User", foreign_key: "user_id"
  belongs_to :store

  validates :start_date, :role , presence: true
  validates :user_id, uniqueness: { scope: :store_id }

  validates :monday_start,:monday_end  ,:tuesday_start,:tuesday_end ,:wednesday_start ,:wednesday_end,:thursday_start,
            :thursday_end,:friday_start,:friday_end  ,:saturday_start  ,:saturday_end,:sunday_start,:sunday_end,
            time_format: true

  validates :monday_start,:monday_end, if: :monday? , presence: true

  validates :tuesday_start,:tuesday_end, if: :tuesday? , presence: true

  validates :wednesday_start,:wednesday_end, if: :wednesday?, presence: true

  validates :thursday_start,:thursday_end, if: :thursday?, presence: true

  validates :friday_start,:friday_end, if: :friday?, presence: true

  validates :saturday_start,:saturday_end, if: :saturday?, presence: true

  validates :sunday_start,:sunday_end, if: :sunday?, presence: true

  def has_timetable?
    monday? or tuesday? or wednesday? or thursday? or friday? or saturday? or sunday?
  end
end
# == Schema Information
#
# Table name: positions
#
#  id              :integer         not null, primary key
#  store_id        :integer
#  user_id         :integer
#  start_date      :date
#  end_date        :date
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  role            :string
#  monday          :boolean
#  tuesday         :boolean
#  wednesday       :boolean
#  thursday        :boolean
#  friday          :boolean
#  saturday        :boolean
#  sunday          :boolean
#  monday_start    :string
#  monday_end      :string
#  tuesday_start   :string
#  tuesday_end     :string
#  wednesday_start :string
#  wednesday_end   :string
#  thursday_start  :string
#  thursday_end    :string
#  friday_start    :string
#  friday_end      :string
#  saturday_start  :string
#  saturday_end    :string
#  sunday_start    :string
#  sunday_end      :string
#

