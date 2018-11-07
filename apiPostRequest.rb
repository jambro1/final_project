require 'net/http'
require 'net/https'
require 'uri'
require 'json'

uri = URI.parse("https://coltest.ekmmetering.com/setMeter?meter=66&key=ZGZsMjZhRTJWVDo2NTI0MDkxMQ")

# header = {'Content-Type': 'application/json'}

body = {
  "Command": "CTRatioSet",
  "Settings": [
    {
      "CTRatioSet": {
        "Access_Password": "00000000",
        "CT_Ratio": 800
      }
    }
  ]
}

https = Net::HTTP.new(uri.host, uri.port)
https.use_ssl = true

req = Net::HTTP::Post.new(uri.path.concat("?meter=66&key=ZGZsMjZhRTJWVDo2NTI0MDkxMQ"))
req['Content-Type'] = 'application/json'
# req['charset'] = 'UTF-8'
req.body = {
  "Command": "CTRatioSet",
  "Settings": [
    {
      "CTRatioSet": {
        "Access_Password": "00000000",
        "CT_Ratio": 800
      }
    }
  ]
}.to_json
res = https.request(req)

p res
