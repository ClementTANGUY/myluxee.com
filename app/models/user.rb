class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true, email_format:true
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  first_name             :string
#  last_name              :string
#  be_contacted           :boolean
#  be_rated               :boolean
#  contact_email          :string
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  email                  :string          default(""), not null
#  encrypted_password     :string          default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  provider               :string
#  uid                    :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  type                   :string
#

