class SenseValue < ActiveRecord::Base
	belongs_to :device, :foreign_key => [:device_id, :gw_id]
end
