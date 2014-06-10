class AdminsController < ApplicationController
  def index
    @all_posts = Post.all.order(posted: :desc)
  end
end
