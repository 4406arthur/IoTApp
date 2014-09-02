
Dashing.scheduler.every '2s' do
  
 

  Dashing.send_event('Air-temprature', { value: 22 +rand(2) })
  Dashing.send_event('water-temprature', { value: 24 +rand(2) })
  Dashing.send_event('EC-value',   { value: rand(1.5..2.5) })
  Dashing.send_event('Ph-value',   { value: 6+rand(0.3) })
  Dashing.send_event('humidity',   { value: rand(60..75) })
  Dashing.send_event('water-level',  { value: rand(900..950) })

end
