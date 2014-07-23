require 'net/http'

uri = URI('http://140.138.150.69/image/jpeg.cgi')

$count = 1
loop do
  res =  Net::HTTP.get(uri)

  f = File.new($count.to_s+".jpg","w")
  f.write(res)
  f.close
  $count += 1
  sleep 3600
end
