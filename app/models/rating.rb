class Rating < ActiveRecord::Base
  SCORE_LIST = [1,2,3,4,5]
  validates :grader_id, :graded_id, :welcome_score,:appearance_score,
            :knowledge_score, :listening_score,
            :global_score, presence: true
  validates :welcome_score,:appearance_score,
              :knowledge_score, :listening_score,
              :global_score, inclusion: SCORE_LIST, allow_blank: true
  validates :grader_id, uniqueness: { scope: :graded_id}
  belongs_to :sales_associate, foreign_key: :graded_id
  belongs_to :account, foreign_key: :grader_id
end
# == Schema Information
#
# Table name: ratings
#
#  id               :integer         not null, primary key
#  grader_id        :integer
#  graded_id        :integer
#  welcome_score    :integer
#  appearance_score :integer
#  knowledge_score  :integer
#  listening_score  :integer
#  global_score     :integer
#  description      :text
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

