require "sinatra"
require "sinatra/reloader"
require "nokogiri"
require "httparty"
require "uri"

get "/" do
  erb :index
end

get "/welcome/:name" do

  erb :welcome
end

get "/lolfinder" do
  erb :lolfinder
end

get "/lol" do
  @username = params[:username]
  url = "http://www.op.gg/summoner/userName=#{@username}"
  url = URI.encode(url)
  response = HTTParty.get(url)
  doc = Nokogiri::HTML(response)
  @win = doc.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins")

  erb :lol
end

get "/vote" do
  erb :vote
end

get "/voteresult" do
  @result = params[:result]
  erb :voteresult
end
