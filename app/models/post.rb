class Post < ApplicationRecord
  belongs_to :topic
  validates :img_link, :title, :body, presence: true
  validates :replies, :likes, :dislikes, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
