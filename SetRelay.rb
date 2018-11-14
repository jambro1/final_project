require 'net/http'
require 'net/https'
require 'uri'
require 'json'

def change_ekm_relay(key, meter, relay_number, args)
  uri = URI.parse('https://coltest.ekmmetering.com/setMeter?meter=66&key=ZGZsMjZhRTJWVDo2NTI0MDkxMQ')

  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true

  req = Net::HTTP::Post.new(uri.path.concat("?meter=#{meter}&key=#{key}"))
  req['Content-Type'] = 'application/json'

  req.body = {
    "Command": 'RelayDurationSet',
    "Settings": [
      {
        'RelayDurationSet': {
          'Access_Password': '00000000',
          'Relay': "Relay_#{relay_number}",
          'Duration': args[:seconds],
          'Status': args[:state]
        }
      }
    ]
  }.to_json

  res = https.request(req)
  p res
end

# California:
#change_ekm_relay('ZGZsMjZhRTJWVDo2NTI0MDkxMQ', 66, "Relay_1", 0)

# Berlin:
perm_on = {state: "closed", seconds: 0}
perm_off = {state: "open", seconds: 0}
temp_on = {state: "closed", seconds: 3}
temp_off = {state: "closed", seconds: 3}

change_ekm_relay('ZGZsMjZhRTJWVDo2NTI0MDkxMQ', 350001437, 2, perm_on)
sleep(2)
change_ekm_relay('ZGZsMjZhRTJWVDo2NTI0MDkxMQ', 350001437, 2, temp_off)

# set time to 0 if you want it to take affect forever
# change Status: to open if you want to open the relay (OFF), set to closed to close it (ON).
# go here to see the change take effect on meter 66:
# https://psrv.ekmmetering.com/readMeter?key=ZGZsMjZhRTJWVDo2NTI0MDkxMQ&cnt=100&format=html&fields=CT_Ratio~State_Out&timezone=America~Vancouver&meters=000000000066
