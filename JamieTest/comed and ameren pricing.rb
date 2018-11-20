# This part is for comed hourly pricing and hourly predicted pricing:

require 'open-uri'
require 'nokogiri'

comed_pricing = []

url = "https://hourlypricing.comed.com/api?type=pricingtabledual&date=20181115"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('td').each do |element|
  p element.text.strip
  sleep(0.01)
  comed_pricing << element.text.strip
  # p element.attribute('td').value
end

p comed_pricing

# ===============

# This part is for ameren hourly pricing:

# require 'open-uri'
# require 'nokogiri'

# ameren_pricing = []

# url = "https://www.powersmartpricing.org/psp/servlet?type=pricingtabledatesingle&date=20181118"

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# html_doc.search('td').each do |element|
#   p element.text.strip
#   sleep(0.01)
#   ameren_pricing << element.text.strip
#   # p element.attribute('td').value
# end

# p ameren_pricing
