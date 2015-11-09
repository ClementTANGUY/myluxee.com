class SalesAssociate < User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :contact_email, presence: true, if: :be_contacted_true, email_format:true

  has_attached_file :avatar, styles: { medium: "171x180#", thumb: "100x100#", tiny: "40x40#" }, default_url: "profile-photo.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :sales_associate_news, dependent: :destroy, class_name: SalesAssociateNews, foreign_key: "user_id"
  accepts_nested_attributes_for :sales_associate_news,
                                reject_if: lambda {|attributes| attributes['content'].blank?}

  has_many :sales_associate_languages, dependent: :destroy, foreign_key: "user_id"
  accepts_nested_attributes_for :sales_associate_languages

  has_many :languages, through: :sales_associate_languages
  accepts_nested_attributes_for :languages,
                                reject_if: lambda {|attributes| attributes['id'].blank?}

  has_many :all_positions, dependent: :destroy, class_name: Position, foreign_key: "user_id"

  has_many :old_positions, -> {where('end_date is not null')}, dependent: :destroy, class_name: Position , foreign_key: "user_id"

  has_many :positions, -> {where('end_date is null')}, dependent: :destroy, foreign_key: "user_id"
  accepts_nested_attributes_for :positions,
                                reject_if: lambda {|attributes| attributes['role'].blank?}

  has_many :stores, ->{order("start_date desc")}, through: :positions, source: :store
  accepts_nested_attributes_for :stores

  has_many :old_stores, ->{order("start_date desc")}, through: :old_positions, source: :store

  has_many :all_stores, ->{order("start_date desc")}, through: :all_positions, source: :store

  has_many :ratings, foreign_key: :graded_id


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

  def oauth_user?
    uid.present?
  end

  def rating_score
    score = 0
    ratings.each{|rating| score += (rating.welcome_score + rating.appearance_score+rating.knowledge_score+
        rating.listening_score+(rating.global_score * 2)) / 6}
    score / ratings.size
  end

  private
  def be_contacted_true
    be_contacted
  end
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

