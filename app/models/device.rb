class Device < ActiveRecord::Base
  belongs_to :plant_wall
  has_many :sense_values , :class_name => 'SenseValue' ,:foreign_key => [:device_id, :gw_id],dependent: :destroy
  
  self.primary_key = [:device_id, :gw_id]

end
