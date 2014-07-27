class Suggestion < ActiveRecord::Base
  belongs_to :plant_wall
  validates  :plant_wall_id, presence: true
  validates  :content, presence: true

end
