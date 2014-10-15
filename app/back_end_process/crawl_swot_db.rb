require 'rubygems'
require 'active_record'
require 'net/http'
require 'json'
require 'composite_primary_keys'
gem 'mysql2'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "root",
  :password => "itismylife7",
  :database => "plantfactory"
)


class SwotUser < ActiveRecord::Base
  has_many :plant_walls, dependent: :destroy
 
  self.primary_key = "gw_id"

end

class PlantWall < ActiveRecord::Base
  has_many :suggestions, dependent: :destroy
  has_many :devices, dependent: :destroy
  belongs_to :swot_user

  def feed
    Suggestion.where("plant_wall_id = ?", id)
  end

end

class Device < ActiveRecord::Base
  belongs_to :plant_wall
  has_many :sense_values , :class_name => 'SenseValue' ,:foreign_key => [:device_id, :gw_id],dependent: :destroy
  
  self.primary_key = [:device_id, :gw_id]
end


class Suggestion < ActiveRecord::Base
  belongs_to :plant_wall
  validates  :plant_wall_id, presence: true
  validates  :content, presence: true
end


class SenseValue < ActiveRecord::Base
  belongs_to :device, :foreign_key => [:device_id, :gw_id]
end




def get_value(gw_id, device_id)
  uri = URI('http://140.138.150.52/task_manager/v2/device')
  params = {:service_id => 60, :service_secret => 'a98fa6a13fe2ba98c28fa52dabcd9acd', :gw_id => gw_id, :device_id => device_id }
  uri.query = URI.encode_www_form(params)

  res = Net::HTTP.get_response(uri)

  json_data = res.body if res.is_a?(Net::HTTPSuccess)
  json_data =JSON.parse(json_data)

  if(json_data["error"] == true)
    puts 'gw network error'
    return 
  end

  device = json_data["device"]
  ##might cause NoMethodError
 
  puts device.first["DATA"]
  return device.first["DATA"]

  #Post.create(:title => json_data["data"], :description => 'test')
end

def get_pic(gw_id, device_id, wall_id)
  uri = URI('http://140.138.150.52/task_manager/v2/device')
  params = {:service_id => 60, :service_secret => 'a98fa6a13fe2ba98c28fa52dabcd9acd', :gw_id => gw_id, :device_id => device_id }
  uri.query = URI.encode_www_form(params)
  res = Net::HTTP.get_response(uri)

  json_data = res.body if res.is_a?(Net::HTTPSuccess)
  json_data =JSON.parse(json_data)


  if(json_data["error"] == true)
    puts 'gw network error'
    return 
  end
  
   
  device = json_data["device"]
  puts device.first["DATA"]

  uri = URI(device.first["DATA"])
  res =  Net::HTTP.get(uri)

  directory_name = "/home/lab1707/IoTApp/app/assets/images/slide/"+wall_id.to_s()
  Dir.mkdir(directory_name) unless File.exists?(directory_name)
  time_stamp=(Time.now.to_f*1000).to_s
  path = "/home/lab1707/IoTApp/app/assets/images/slide/"+wall_id.to_s()+'/'+time_stamp+".jpg"
  f = File.new(path,"w")
  f.write(res)
  f.close
  puts 'get pic on wall: '+ wall_id.to_s()+ ' time stamp:  '+(Time.now.to_f * 1000).to_s+".jpg"
  path = "slide/"+wall_id.to_s()+'/'+time_stamp+".jpg"

  return path

end

def suggestion(val, device)
  #same value probelm
  #old_value = device.sense_values.last.data
  #if old_value.to_f() == val.to_f()
    #puts 'arduino POST error'
    #return meg = ' Your Arduino ethernet maybe occure a problem, your ' + device.name + ' get same value !'
  if device.category == '55'
    return meg = 'the indoor temperature is to high' if val.to_f() > 28
    return meg = 'the indoor temperature is to low' if val.to_f() < 20
  elsif device.category == '56'
    return meg = 'the humidity is to high' if val.to_f() > 70
    return meg = 'the humidity is to low' if val.to_f() < 60
  elsif device.category == '57'
    return meg = 'the water PH is to high' if val.to_f() > 6.5
    return meg = 'the water PH is to low' if val.to_f() < 5
  elsif device.category == '58'
    return meg = 'the water temperature is to high' if val.to_f() > 25
  elsif device.category == '59'
    return meg = 'level of water warning' if val.to_f() < 700
   elsif device.category == '62'
    return meg = 'EC of water is to high' if val.to_f() > 2.0 
    return meg = 'EC of water is to low' if val.to_f() < 1.8
  end  
    
end


def get_test
  prng = Random.new
  val = prng.rand(1.0..70.0)
  puts val
  return val
end

def throw_event
  return 'sensor not working'
end

count = 1
loop do 
    puts  "pass:"  + count.to_s()
    SwotUser.all.each do |u|
      fb_id = u.fb_id
      gw_id = u.gw_id
      walls = u.plant_walls
      walls.each do |wall|
        devices = wall.devices
        devices.each do |device|      
          #for test
          if device.category == '55' || device.category == '56'|| device.category == '57' || device.category == '58' || device.category =='59' || device.category == '62'
            val = get_value(device.gw_id, device.device_id)
            msg= suggestion(val, device)
            #val = get_test
            SenseValue.create(:data => val, :device_id => device.device_id, :gw_id => device.gw_id)
            if (count == 30 || count == 60 )
              Suggestion.create(:content => msg, :plant_wall => wall)
            end  
          elsif device.category == '61'
            if (count == 60 )
              SenseValue.create(:description => get_pic(device.gw_id, device.device_id, wall.id), :device_id => device.device_id, :gw_id => device.gw_id )
            end
          end
        end
      end
    end
    
    if count == 60
      count = 0
    end

    count += 1
    sleep(100.seconds)
end
