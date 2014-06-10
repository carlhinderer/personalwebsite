module PostsHelper
  def formatted_post_date(date)
    date.strftime("%B, %-d, %Y")
  end

  def formatted_tag_list(tags)
    tags.map { |tag| link_to tag.name, "/posts/tag/#{tag.name}" }
        .join(", ").html_safe
  end
end
