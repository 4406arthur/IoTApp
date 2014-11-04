


def get_value(gw_id, device_id)
  uri = URI('http://140.138.150.52/task_manager/v2/device')
  params = {:service_id => 60, :service_secret => 'a98fa6a13fe2ba98c28fa52dabcd9acd', :gw_id => gw_id, :device_id => device_id }
  uri.query = URI.encode_www_form(params)

  res = Net::HTTP.get_response(uri)

  json_data = res.body if res.is_a?(Net::HTTPSuccess)
  json_data =JSON.parse(json_data)
  device = json_data["device"]
  puts device.first["DATA"]
  return device.first["DATA"]

  #Post.create(:title => json_data["data"], :description => 'test')
end





Dashing.scheduler.every '3600s' do
  #request.session_options[:gw_id]
  
  Dashing.send_event('Air-temprature', { value: get_value(105,23) })
  Dashing.send_event('water-temprature', { value: get_value(105,22) })
  Dashing.send_event('EC-value',   { value: rand(1.5..2.5) })
  Dashing.send_event('Ph-value',   { value: get_value(105,21) })
  Dashing.send_event('humidity',   { value: get_value(105,24) })
  Dashing.send_event('water-level',  { value: get_value(105,25) })

end


