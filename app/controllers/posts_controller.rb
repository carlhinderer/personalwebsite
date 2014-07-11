class PostsController < ApplicationController
  before_action :authenticate_admin!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    if params[:category]
      @posts = Category.find_by_name(params[:category].capitalize).posts
    elsif params[:tag]
      @posts = Tag.find_by_name(params[:tag]).posts
    else
      @posts = Post.all
    end
    @posts = @posts.order(created_at: :desc).page params[:page]
  end

  def show
    @post = Post.friendly.find params[:id]
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post '#{@post.title}' was successfully saved."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.friendly.find params[:id]
    @tags = Tag.all
  end

  def update
    @post = Post.friendly.find params[:id]
    if @post.update_attributes(post_params)
      flash[:notice] = "Post '#{@post.title}' was successfully updated."
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.friendly.find params[:id]
    @post.destroy
    flash[:notice] = "Post '#{@post.title}' was successfuly destroyed."
    redirect_to manage_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :posted, :category_id, tag_ids: [])
  end
end
