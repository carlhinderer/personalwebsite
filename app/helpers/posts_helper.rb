module PostsHelper
  def formatted_post_date(date)
    date.strftime("%B, %-d, %Y")
  end

  def formatted_tag_list(tags)
    tags.map { |tag| link_to tag.name, "/posts/tag/#{tag.name}" }
        .join(", ").html_safe
  end

  def truncated_post_body(body)
    truncate(body.split(/```|~~~|\r|\n/).first, :length => 400)
  end
end
