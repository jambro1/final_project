# latest hour average price

require 'net/http'
require 'json'
require 'pp'
require 'date'

def comed_avg
  api_string = '/api?type=currenthouraverage'
  json = Net::HTTP.get('hourlypricing.comed.com', api_string)
  JSON.parse(json)
end

puts comed_avg[0]
puts comed_avg[0]['millisUTC']
puts comed_avg[0]['price']
