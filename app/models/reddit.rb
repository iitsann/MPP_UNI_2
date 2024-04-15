class Reddit < ApplicationRecord
  paginates_per 15

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "link", "subreddit", "topic", "updated_at"]
  end
end
