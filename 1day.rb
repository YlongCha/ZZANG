#브라우저 오픈과 관련된 잼을 불러온다
require "launchy"
idol =  ["iu", "redvelvet","twice","girlsgeneration","AOA"]
url = "https://search.naver.com/search.naver?where=image&sm=tab_jum&query="
idol.each do |d|
	Launchy.open(url+d)
end
