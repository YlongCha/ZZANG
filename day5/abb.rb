require "sinatra"
require "sinatra/reloader"
require "data_mapper"

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post #Post모델에 관한 설정을 함
  include DataMapper::Resource
  property :id, Serial #자동으로 숫자를 지정해서 늘어남(key값)
  property :title, String #문자열길이 제한
  property :content, Text #문자열길이제한 없음
  property :created_at, DateTime
end

DataMapper.finalize #모델에 관련된 설정이 완료되었다고 알려줌

Post.auto_upgrade! #설정되있는 테이블을 생성

set :bind, '0.0.0.0'

get "/" do
  @post = Post.all
  erb :index
end

get "/new" do
  erb :new
end

get "/create" do
  @title = params[:title]
  @content = params[:content]
  Post.create(:title => @title, :content =>@content)
  redirect "/"
end

get "/posts/:id" do
  @post = Post.get(params[:id])
  erb :posts
end
get "/destroy/:id" do
  @post = Post.get(params[:id])
  @post.destroy
  redirect "/"
end

get "/edit/:id" do
  @post = Post.get(params[:id])
  erb :edit
end

get "/update/:id" do
  @post = Post.get(params[:id])
  @post.update(:title => params[:title],
  :content => params[:content])
  redirect "/"
end
