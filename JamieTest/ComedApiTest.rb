require 'net/http'
require 'json'
require 'pp'
require 'date'

def get_comed_data(starttime, endtime = Time.now.utc.strftime('%Y%m%d%H%M'))
  api_string = "/api?type=5minutefeed&datestart=#{starttime}&dateend=#{endtime}"
  json = Net::HTTP.get('hourlypricing.comed.com', api_string)
  return JSON.parse(json)
end

def api_date(minutesbackwards)
  time_now = Time.now.utc - (minutesbackwards * 60)
  return time_now.strftime('%Y%m%d%H%M')
end

def convertToUTCMilli(strftime)
  unless strftime.zero?
    time = (strftime.to_i / 1000).to_s
    return DateTime.strptime(time, '%s')
  end
end

api_object_time = get_comed_data(api_date(30))
puts api_object_time
