class PlantWall < ActiveRecord::Base
  has_many :suggestions, dependent: :destroy
  has_many :devices, dependent: :destroy
  belongs_to :swot_user

  def feed
    Suggestion.where("plant_wall_id = ?", id)
  end

end
