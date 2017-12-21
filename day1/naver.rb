require 'httparty'
require 'nokogiri'
require 'rest-client'
url = "http://m.news.nate.com/hissue/list?isq=9704&mid=m00" #네이버 주소 저장
response = RestClient.get(url) #url을 통해 요청
# puts response
doc = Nokogiri::HTML(response)
kospi = doc.css("span.tb > strong.tit")
kospi.each do |t|
  puts t.text
end
