require 'net/http'
require 'net/https'
require 'uri'
require 'json'

def change_ct_ratio(key, meter, ct_ratio)
  uri = URI.parse('https://coltest.ekmmetering.com/setMeter?meter=66&key=ZGZsMjZhRTJWVDo2NTI0MDkxMQ')

  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true

  req = Net::HTTP::Post.new(uri.path.concat("?meter=#{meter}&key=#{key}"))
  req['Content-Type'] = 'application/json'

  req.body = {
    "Command": 'CTRatioSet',
    "Settings": [
      {
        'CTRatioSet': {
          'Access_Password': '00000000',
          'CT_Ratio': ct_ratio
        }
      }
    ]
  }.to_json

  res = https.request(req)
  p res
end

change_ct_ratio('ZGZsMjZhRTJWVDo2NTI0MDkxMQ', 66, 800)

# possible CT Ratio Settings 100, 200, 400, 800, 1500, 3000, 5000
# go here to see the change take effect on meter 66:
# https://psrv.ekmmetering.com/readMeter?key=ZGZsMjZhRTJWVDo2NTI0MDkxMQ&cnt=100&format=html&fields=CT_Ratio~State_Out&timezone=America~Vancouver&meters=000000000066
