class SalesAssociate < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true, email_format:true
  validates :contact_email, presence: true, if: :be_contacted_true, email_format:true


  has_many :sales_associate_news, dependent: :destroy, class_name: SalesAssociateNews
  accepts_nested_attributes_for :sales_associate_news,
                                reject_if: lambda {|attributes| attributes['content'].blank?}

  has_many :sales_associate_languages, dependent: :destroy
  has_many :languages, through: :sales_associate_languages

  has_many :old_positions, -> {where('end_date is not null')}, dependent: :destroy, class_name: :position

  has_many :positions, -> {where('end_date is null')}, dependent: :destroy
  has_many :stores, through: :positions

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name =  auth.info.last_name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
  private
  def be_contacted_true
    be_contacted
  end
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
#  contact_email          :string(255)
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
#  provider               :string(255)
#  uid                    :string(255)
#

