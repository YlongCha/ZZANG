require 'httparty'
require 'nokogiri'
require 'rest-client'
url = "http://m.app.melon.com/index.htm" #네이버 주소 저장
response = RestClient.get(url) #url을 통해 요청
# puts response
doc = Nokogiri::HTML(response)
kospi = doc.css("p.title.ellipsis")
puts kospi
