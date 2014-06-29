class Device < ActiveRecord::Base
  belongs_to :swot_user
  self.primary_key = :device_id
end
