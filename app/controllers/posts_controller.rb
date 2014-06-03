class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
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
    redirect_to root_path
  end

  def index_programming
    @posts = Post.joins(:category).where(:categories => {:name => 'Programming'}).order(created_at: :desc)
  end

  def index_personal
    @posts = Post.joins(:category).where(:categories => {:name => 'Personal'}).order(created_at: :desc)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :posted, :category_id)
  end
end
