class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def index_programming
    @posts = Post.joins(:category).where(:categories => {:name => 'Programming'}).order(created_at: :desc)
  end

  def index_personal
    @posts = Post.joins(:category).where(:categories => {:name => 'Personal'}).order(created_at: :desc)
  end
end
