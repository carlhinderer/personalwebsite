require 'uri'

module CommentsHelper
  def comment_author_with_website(comment)
    if comment.author_website.blank?
      comment.author
    else
      uri = URI::HTTP.build({:host => comment.author_website})
      link_to(comment.author, uri.to_s)
    end
  end
end
