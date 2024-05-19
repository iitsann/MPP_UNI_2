class UserPostsQuery
  def self.call(user_id)
    User.find(user_id).posts.where(is_hidden: false).order(likes: :desc, dislikes: :asc)
  end
end
