require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

url = 'http://www.surfline.com/surf-report/venice-beach-southern-california_4211/'

page = Nokogiri::HTML(open(url))

surf_height = page.css('#observed-wave-range').inner_html

surf_descriptionOG = page.css('#observed-wave-description').inner_html.gsub(/\n/, "")
surf_description_arr = []
surf_descriptionOG.scan(/\w+/) do |x|
  surf_description_arr.push(x)
end
surf_description = surf_description_arr.join(' ')

surf_conditions = []
surf_conditions.push(
  date: Time.now,
  height: surf_height,
  description: surf_description,
  report: surf_report
)

#puts JSON.pretty_generate(surf_conditions)


File.open("surfreport.txt", 'w') do |f|
  f.puts JSON.pretty_generate(surf_conditions)
end
