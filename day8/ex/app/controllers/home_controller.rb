class HomeController < ApplicationController
  def index
  end

  def new
  end

  def create
    Post.create(:username => params[:username],
             :title => params[:title],
             :content => params[:content])
     redirect_to "/"
  end

  def list
    @posts = Post.all
  end

  def posts
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(:username => params[:username],
      :title => params[:title],
      :content => params[:content])
      redirect_to "/list"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/list"
  end
end
