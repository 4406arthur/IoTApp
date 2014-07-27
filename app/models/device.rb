class Device < ActiveRecord::Base
  belongs_to :plant_wall
  has_many :sense_values ,dependent: :destroy
  
  self.primary_key = [:device_id, :gw_id]

end
