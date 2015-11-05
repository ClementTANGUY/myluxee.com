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
#  monday             :boolean(1)
#  tuesday            :boolean(1)
#  wednesday          :boolean(1)
#  thursday           :boolean(1)
#  friday             :boolean(1)
#  saturday           :boolean(1)
#  sunday             :boolean(1)
#  monday_start       :string(255)
#  monday_end         :string(255)
#  tuesday_start      :string(255)
#  tuesday_end        :string(255)
#  wednesday_start    :string(255)
#  wednesday_end      :string(255)
#  thursday_start     :string(255)
#  thursday_end       :string(255)
#  friday_start       :string(255)
#  friday_end         :string(255)
#  saturday_start     :string(255)
#  saturday_end       :string(255)
#  sunday_start       :string(255)
#  sunday_end         :string(255)
#

