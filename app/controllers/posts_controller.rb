class PostsController < ApplicationController
  #before_action :authenticate_admin!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    if params[:category_or_tag] == 'programming'
      @posts = Post.joins(:category).where(:categories => {:name => 'Programming'}).order(created_at: :desc)
    elsif params[:category_or_tag] == 'personal'
      @posts = Post.joins(:category).where(:categories => {:name => 'Personal'}).order(created_at: :desc)
    elsif !params[:category_or_tag]
      @posts = Post.order(created_at: :desc)
    else
      @posts = Post.joins(:tags).where(:tags => {:name => params[:category_or_tag]}).order(created_at: :desc)
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
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
    @post = Post.find params[:id]
    @tags = Tag.all
  end

  def update
    @post = Post.find params[:id]
    if @post.update_attributes(post_params)
      flash[:notice] = "Post '#{@post.title}' was successfully updated."
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    flash[:notice] = "Post '#{@post.title}' was successfuly destroyed."
    redirect_to manage_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :posted, :category_id, tag_ids: [])
  end
end
