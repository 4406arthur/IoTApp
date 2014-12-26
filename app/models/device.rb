class Device < ActiveRecord::Base
  belongs_to :plant_wall
  has_many :sense_values

end
