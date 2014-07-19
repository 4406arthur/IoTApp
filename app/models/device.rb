class Device < ActiveRecord::Base
  belongs_to :swot_user, :foreign_key => [ :device_id, :swot_user_id]
  has_many :sense_values ,dependent: :destroy
  
  self.primary_key = :device_id, :swot_user_id


end
