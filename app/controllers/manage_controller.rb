class ManageController < ApplicationController
  before_action :authenticate_admin!

  def index
    @all_posts = Post.all.order(posted: :desc)
  end
end
