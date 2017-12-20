class UserController < ApplicationController
  def index
  end

  def new
  end

  def create
    Wowcha.create(:username => params[:username],
             :title => params[:title],
             :content => params[:content])
  end

  def list
    @posts = Wowcha.all
  end

  def show
    @post = Wowcha.find(params[:id])

  end

  def update
    @post = Wowcha.find(params[:id])
    @post.update(:username => params[:username],
             :title => params[:title],
             :content => params[:content])
    redirect_to "/user/list"
  end

  def edit
    @post = Wowcha.find(params[:id])
  end

  def destroy
    @post = Wowcha.find(params[:id])
    
    @post.destroy
    redirect_to "/user/list"
  end

  def add_comment
    Comment.create(
      content: params[:comments],
      wowcha_id: params[:id]
      )
    redirect_to :back
  end
end
