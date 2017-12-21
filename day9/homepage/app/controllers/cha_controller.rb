class ChaController < ApplicationController
  def index
  end

  def new
  end

  def create
    Post.create(:title => params[:title],
    :content => params[:content])
    redirect_to "/"
  end

  def posts
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
