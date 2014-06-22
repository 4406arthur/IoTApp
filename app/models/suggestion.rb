class Suggestion < ActiveRecord::Base
  belongs_to :swot_user
  validates  :swot_user_id, presence: true
  validates  :content, presence: true
end
