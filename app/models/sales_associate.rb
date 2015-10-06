class SalesAssociate < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
# == Schema Information
#
# Table name: sales_associates
#
#  id                     :integer(4)      not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  be_contacted           :boolean(1)
#  be_rated               :boolean(1)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer(4)      default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

