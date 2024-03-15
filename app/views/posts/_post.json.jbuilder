json.extract! post, :id, :topic, :replies, :img_link, :title, :body, :likes, :dislikes, :created_at, :updated_at
json.url post_url(post, format: :json)
