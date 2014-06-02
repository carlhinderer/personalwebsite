module PostsHelper
  def formatted_post_date(date)
    date.strftime("%B, %-d, %Y")
  end

  def formatted_tag_list(tags)
    tags.map { |tag| tag.name }
        .join(", ")
  end
end
