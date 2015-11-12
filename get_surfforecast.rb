require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

url = 'http://www.surfline.com/surf-forecasts/southern-california/south-los-angeles_2951/'

page = Nokogiri::HTML(open(url))

today_height = page.css('#observed_component > div:nth-child(3) > div.super.obs-bx > div > div > div:nth-child(1) > div:nth-child(3) > div > div:nth-child(1) > h1').inner_html
today_height_details = page.css('#observed_component > div:nth-child(3) > div.super.obs-bx > div > div > div:nth-child(1) > div:nth-child(3) > div > div:nth-child(1) > span:nth-child(4)').inner_html
today_conditions = page.css('#observed_component > div:nth-child(3) > div.super.obs-bx > div > div > div:nth-child(1) > div:nth-child(1) > strong').inner_html
today_description = page.css('#observed_component > div:nth-child(3) > div.super.obs-bx > div > div > div:nth-child(1) > div:nth-child(3) > div > span').inner_html

tomorrow_height = page.css('#observed_component > div:nth-child(3) > div.super.obs-bx > div > div > div:nth-child(2) > div:nth-child(3) > div > div:nth-child(1) > h1').inner_html
tomorrow_height_details = page.css('#observed_component > div:nth-child(3) > div.super.obs-bx > div > div > div:nth-child(2) > div:nth-child(3) > div > div:nth-child(1) > span:nth-child(4)').inner_html
tomorrow_conditions = page.css('#observed_component > div:nth-child(3) > div.super.obs-bx > div > div > div:nth-child(2) > div:nth-child(1) > strong').inner_html
tomorrow_description = page.css('#observed_component > div:nth-child(3) > div.super.obs-bx > div > div > div:nth-child(2) > div:nth-child(3) > div > span').inner_html

today = []
today.push(
  height: today_height,
  conditions: today_conditions,
  height_details: today_height_details,
  description: today_description
)

puts "Today the waves are #{today_height} (#{today_height_details}) and #{today_conditions}. Official details: #{today_description}"

tomorrow = []
tomorrow.push(
  height: tomorrow_height,
  conditions: tomorrow_conditions,
  height_details: tomorrow_height_details,
  description: tomorrow_description
)
