require "sinatra"
require "sinatra/reloader"
require "nokogiri"
require "httparty"
require "uri"

get "/" do
  erb :main
end

get "/car" do
  @carname = params[:carname]
  erb :car
end

get "/carview" do
  @q = params[:q]
  url = "http://auto.danawa.com/search/?q=#{@q}"
  url = URI.encode(url)
  response = HTTParty.get(url)
  doc = Nokogiri::HTML(response)
  @imgs = doc.css(".modelImg").css('img').attr('src')
  # @imgs_url = ("#autodanawa_gridC > div.gridWide > article > main > div.searchModelSummary.estm > div > div.modelContents > a > img")
  erb :carview
end
