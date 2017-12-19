class UserController < ApplicationController
  def new
  end

  def create
    @title = params[:title]
    @content = params[:content]
    Post.create(
      :title => @title,
      :content => @content
    )
    redirect_to "/"
  end

  def posts
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @id = params[:id]
    Post.find(@id).update(
      :title => params[:title],
      :content => params[:content]
    )
    redirect_to "/posts"
  end

  def destroy
    @id = params[:id]
    Post.find(@id).destroy
    redirect_to "/posts"
  end
end
