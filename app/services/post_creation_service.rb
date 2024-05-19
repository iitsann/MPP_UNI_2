class PostCreationService
  def self.create_post(user, post_params)
    post = user.posts.new(post_params)
    post.replies = 0
    post.likes = 0
    post.dislikes = 0

    if post.save
      {status: :created, post:, message: "Post was successfully created."}
    else
      {status: :unprocessable_entity, errors: post.errors}
    end
  end
end
