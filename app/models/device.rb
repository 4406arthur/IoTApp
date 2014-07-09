class Device < ActiveRecord::Base
  belongs_to :swot_user
  has_many :sense_values ,dependent: :destroy
  self.primary_key = :device_id
end
