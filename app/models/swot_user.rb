class SwotUser < ActiveRecord::Base
  has_many :plant_walls, dependent: :destroy
 
  self.primary_key = "gw_id"


end
