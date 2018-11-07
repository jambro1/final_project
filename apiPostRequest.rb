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

Net::HTTP.start(uri.host, uri.port) do |http|
  res = Net::HTTP.post_form(uri, 'Command' => "CTRatioSet", "Settings" => ["CTRatioSet" => {"Access_Password" => "00000000", "CT_Ratio" => 800}])
  puts res.body

  response = http.request request # Net::HTTPResponse object
end
