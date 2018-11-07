require 'net/http'
require 'json'
require 'pp'

# Call the callApi method to create a usable
# object named apiObject from the API request URI
# Put the API request URI in the call
def call_api(api_request)
  json = Net::HTTP.get('hourlypricing.comed.com', api_request)
  JSON.parse(json)
end

# Call the callApi method to create a usable
# object named apiObject from the API request URI
# Put the API request URI in the call
# URI only NOT URL - Do not include http://io.ekmpush.com

time = Time.now

full_time = "#{time.year}#{'%02d' % time.month}#{'%02d' % time.day}#{'%02d' % time.hour}#{ '%02d' % time.min}"

api_object = call_api('/api?type=5minutefeed')
 api_object_time = call_api("/api?type=5minutefeed&datestart=#{full_time.to_i - 20000}&dateend=#{full_time.to_i}")

# This just displays the object but you can use what ever
# code you would like to work with the object here

puts Time.now
puts Time.now.to_i

puts full_time.to_i

latest_read = api_object_time[0]

puts "Time from Comed: #{latest_read['millisUTC']}"
puts "Price from Comed: #{latest_read['price']}"

puts latest_read

# puts api_object[1]
