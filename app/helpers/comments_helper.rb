module CommentsHelper
  def comment_author_with_website(comment)
    if comment.author_website.blank?
      comment.author
    else
      link_to(comment.author, comment.author_website)
    end
  end
end
