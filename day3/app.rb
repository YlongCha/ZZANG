require "sinatra"
require "sinatra/reloader"
require "csv"
require "date"

before do
  p "*******************************************"
  p params
  p"********************************************"
end
get "/" do
  send_file "index.html"
end
get "/post" do
  erb :post
end

get "/postview" do
  @txt=params[:txt]
  @content = params[:content]
  CSV.open("Chayeongrong.csv","a+:utf-8") do |csv|
    csv <<[@txt,@content]
  end
  erb :postview
end
get "/posts" do
  @posts = []
  CSV.foreach('Chayeongrong.csv',encoding: 'utf-8') do |row|
  @posts << row
  end
  erb :posts
end
get "/signup" do
  erb :signup
end
get "/usercomplete" do
  @email = params[:email]
  @pwd = params[:pwd]
  @pwd2 = params[:pwd2]
  @time = Time.now.to_s
  if @pwd == @pwd2
    CSV.open("User.csv","a+:utf-8") do |csv|
      csv << [@email,@pwd,@time]
    end
    erb :usercomplete
  else
    redirect "/signup"
  end
end

get "/userlist" do
  @userlist = []
  CSV.foreach('User.csv',encoding: 'utf-8') do |row|
  @userlist << row
  end
  erb :users
end
