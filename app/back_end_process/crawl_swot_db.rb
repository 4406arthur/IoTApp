require 'rubygems'
require 'active_record'
require 'net/http'
require 'json'
gem 'mysql2'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "root",
  :password => "1707",
  :database => "plantfactory"
)


class SwotUser < ActiveRecord::Base
  has_many :devices ,dependent: :destroy
end

class Device < ActiveRecord::Base
  has_many :sense_values ,dependent: :destroy
  belongs_to :swot_user
end

class SenseValue < ActiveRecord::Base
	belongs_to :device
end



def get_value(gw_id, device_id)
  uri = URI('http://140.138.150.52/task_manager/v2/device')
  params = {:service_id => 60, :service_secret => 'a98fa6a13fe2ba98c28fa52dabcd9acd', :gw_id => gw_id, :device_id => device_id }
  uri.query = URI.encode_www_form(params)

  res = Net::HTTP.get_response(uri)

  json_data = res.body if res.is_a?(Net::HTTPSuccess)
  json_data =JSON.parse(json_data)
  return json_data["data"]

  #Post.create(:title => json_data["data"], :description => 'test')
end



loop do
    SwotUser.all.each do |u|
    	gw_id = u.gw_id
    	dev = u.devices
    	dev.each do |d|
    		device_id= d.device_id
    		val = get_value(gw_id, device_id)
    		SenseValue.create(:data => val, :device => d)
    	end
    end

    sleep(1.minutes)
end