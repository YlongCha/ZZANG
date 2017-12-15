require "sinatra"
require "sinatra/reloader"
require "data_mapper"

DataMapper::setup(:default,"sqlite3://#{Dir.pwd}/blog.db")

class Post
	include DataMapper::Resource
	property :id, Serial
	property :title,String
	property :content,Text
	property :created_at,DateTime
end

DataMapper.finalize
Post.auto_upgrade!

set :bind, "0.0.0.0"

get "/" do
	@posts = Post.all.reverse
	erb :index
end
get "/create" do
	erb :create
end
get "/complete" do
	@post = params[:title]
	@content = params[:content]
	Post.create(:title => @post,
		:content => @content)
	redirect "/"
end
