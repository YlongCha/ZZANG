require "sinatra"
require "sinatra/reloader"
require 'rubygems'
require 'sinatra'
require 'data_mapper'
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")
class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :content, Text
  property :created_at, DateTime
end
class User
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :pwd, Text
  property :created_at, DateTime
end
DataMapper.finalize

Post.auto_upgrade!
User.auto_upgrade!

set :bind, "0.0.0.0" #가상환경에서 쓰이는 것
before do
  p "************************************************"
  p params
  p "************************************************"
end
get "/" do
  @posts = Post.all.reverse #Post객체에 저장되어있는것을 모두 긁어옴
  erb :index
end

get "/post" do
  erb :post
end
# C-R-U-D
# C : create ex)게시글 하나를 쓴다
# R : read ex) 게시판 목록 or 하나의 게시글
# U : Update ex) 게시글 수정
# D : Destroy ex) 게시글 삭제
get "/complete" do
  @title = params[:title]
  @content = params[:content]
  Post.create(
    :title => @title,
    :content => @content)
  erb :complete
end

get "/signup" do
  erb :signup
end

get "/usercomplete" do
  @email = params[:email]
  @pwd = params[:pwd]
  User.create(:email => @email, :pwd => @pwd)
  erb :usercomplete
end

get "/users" do
  @users = User.all
  erb :users
end
