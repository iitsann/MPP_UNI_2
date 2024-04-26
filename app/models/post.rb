class Post < ApplicationRecord
  belongs_to :topic
  validates :img_link, :title, :body, presence: true
  validates :replies, :likes, :dislikes, numericality: {greater_than_or_equal_to: 0}, allow_nil: true

  def self.ransackable_associations(_auth_object=nil)
    ["topic"]
  end

  def self.ransackable_attributes(_auth_object=nil)
    %w[body created_at dislikes id id_value img_link likes replies title topic_id
       updated_at is_hidden]
  end
end
