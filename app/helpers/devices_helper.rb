module DevicesHelper

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
    puts device.first["DATA"]
    return device.first["DATA"]
  end
end
