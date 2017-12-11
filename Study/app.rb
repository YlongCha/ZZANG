#http://localhost:4567/
require "sinatra"

get "/" do        #  "/" -> 루트페이지
  send_file "index.html"
end

get "/welcome" do
  send_file "welcome.html"
end

get "/welcome/:name" do
  @name = params[:name]
  erb :welcome
end

get "/squre/:num" do
  @num = params[:num]
  erb :hello
end

get "/lotto" do
  @lotto = (1..45).to_a.sample(6)
  erb :lotto
end

get "/google" do
  erb :google
end

get "/search" do
  @q = params[:q]
  @name = params[:name]
  erb :search
end

get "/lunch" do
  @lunch = ["배추김치", "깍두기", "오이소박이", "갓김치", "파김치"].sample
  @img_url = {
    "배추김치" => "http://blogfiles12.naver.net/MjAxNzA0MDJfMzgg/MDAxNDkxMTIxMTQyODI2.0RrfRnSCfLvsKY4YxZTPwDiCynbRoGhMZob2H1M5pB8g.f64U33cbRtyHzEbUxNkXMzj-2Nx-M4gdI-3QC8oU9qYg.JPEG.hobby5699/downloadfile-32.jpeg",
    "깍두기"=>"http://cafefiles.naver.net/20130324_251/algml7767_1364092025826PdgdO_JPEG/%B1%EF%B5%CE%B1%E2.jpg",
    "오이소박이"=>"http://blogfiles11.naver.net/20160110_42/leeki021_1452431064539K4Ibt_JPEG/20160110_212603.jpg",
    "갓김치" => "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles5.naver.net%2F20160203_112%2Ftrain95_1454495778620v4QCG_JPEG%2F%25B0%25AB%25B1%25E8%25C4%25A1_DSC06444.JPG&type=b400",
    "파김치" => "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles5.naver.net%2F20140211_13%2Fnajuaree_1392072510811LJI7G_JPEG%2F%25BF%25C0%25C2%25A1%25BE%25EE%25C6%25C4%25B1%25E8%25C4%25A1_copy.jpg&type=b400"
  }
  erb :lunch
end

get "/game" do
  @RSP = params[:q]
  @img_RSP = {
    "가위" => "http://ojsfile.ohmynews.com/STD_IMG_FILE/2015/0217/IE001802355_STD.jpg",
    "바위" => "http://cfile7.uf.tistory.com/image/19176C384FB33AB632B4C6",
    "보" => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYx1HuAjNFKgaoKew5Bw947v5cdO_yDDq2z9__WPZk4RfyVZ-_"
  }
  @PC_RSP=["가위","바위","보"].sample
  erb :game
end
