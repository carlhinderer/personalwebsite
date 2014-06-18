class TagsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag '#{@tag.name}' was successfully created."
    end
    redirect_to tags_path
  end

  def destroy
    @tag = Tag.find params[:id]
    @tag.destroy
    flash[:notice] = "Tag '#{@tag.name}' was successfully destroyed."
    redirect_to tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
