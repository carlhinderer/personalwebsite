class CommentsController < ApplicationController
  before_filter :has_post, :only => [:new, :create]

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.posted = Time.now
    if !(@post.comments << @comment) 
      flash[:warning] = 'A problem was encountered. Unable to save comment.'
    end
    redirect_to post_path(@post.id)
  end

  protected
  def has_post
    unless (@post = Post.find(params[:post_id]))
      flash[:warning] = 'Comments can only be applied to existing blog posts.'
      redirect_to root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :author_website, :body)
  end
end
