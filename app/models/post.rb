class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_one_attached :image
  validates :title, :body, presence: true
  validates :replies, :likes, :dislikes, numericality: {greater_than_or_equal_to: 0}, allow_nil: true
  validate :acceptable_image

  def acceptable_image
    return unless image.attached?

    unless image.byte_size <= 3.megabytes
      errors.add(:image, 'is too large. Image must be less than 3MB.')
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, 'must be a JPEG or PNG.')
    end
  end

  def self.ransackable_associations(_auth_object=nil)
    ["topic"]
  end

  def self.ransackable_attributes(_auth_object=nil)
    %w[body created_at dislikes id id_value img_link likes replies title topic_id
       updated_at is_hidden]
  end
end
