require 'open-uri'
require 'nokogiri'


url = "https://www.powersmartpricing.org/prices/"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

p html_doc.search('fancybox-overlay')

html_doc.search('.pricingBox').each do |element|
  puts element.text.strip
  puts element.attribute('td').value
end
