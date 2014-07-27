class Suggestion < ActiveRecord::Base
  belongs_to :plant_wall
  validates  :swot_user_id, presence: true
  validates  :content, presence: true

end
