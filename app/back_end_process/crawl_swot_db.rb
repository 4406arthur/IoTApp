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
  belongs_to :swot_user, :foreign_key => [ :device_id, :swot_user_id]
  has_many :sense_values ,dependent: :destroy, :foreign_key => [ :device_id, :swot_user_id]
  
  self.primary_key = :device_id, :swot_user_id

end

class SenseValue < ActiveRecord::Base
	belongs_to :device ,:foreign_key => [ :device_id, :swot_user_id]
end

class Suggestion < ActiveRecord::Base
  belongs_to :swot_user
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

def get_test
  prng = Random.new
  val = prng.rand(20.0..30.0)
  puts val
  return val
end

def throw_event
  return 'sensor not working'
end


loop do
    SwotUser.all.each do |u|
      fb_id = u.fb_id
    	gw_id = u.gw_id
    	dev = u.devices
    	dev.each do |d|
    		device_id= d.device_id
    		#val = get_value(gw_id, device_id)
        #for test
        val = get_test
    		SenseValue.create(:data => val, :device_id => device_id)
      end
    end
   
    #for test throw_event
    SwotUser.all.each do |u|
      msg = throw_event
      Suggestion.create(:content => msg, :swot_user => u)
    end


    sleep(1.hours)
end