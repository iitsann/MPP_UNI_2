class PostSortingService
  def self.sort_posts(sort_by, direction)
    posts = Post.where(is_hidden: false)
    direction = direction == "desc" ? :desc : :asc

    case sort_by
    when "date"
      posts.order(created_at: direction)
    when "rating"
      posts.sort_by do |post|
        reactions = post.likes + post.dislikes
        rating = if reactions > 0
                   post.likes.to_f / reactions
                 elsif post.likes == 0 && post.dislikes > 0
                   -1
                 else
                   -2
                 end
        direction == :desc ? -rating : rating
      end
    when "topics"
      posts.joins(:topic).order("topics.name #{direction}")
    else
      posts.order(created_at: direction)
    end
  end
end
