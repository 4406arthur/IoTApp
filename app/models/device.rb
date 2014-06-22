class Device < ActiveRecord::Base
  belongs_to :swot_user
  set_primary_key :device_id
end
