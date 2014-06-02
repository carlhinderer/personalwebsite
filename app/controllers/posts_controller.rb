class PostsController < ApplicationController
  def index
    @posts = Post.order(posted: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
end
