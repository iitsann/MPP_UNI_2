class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  has_many :messages
  has_many :private_chats_as_profile1, class_name: "PrivateChat", foreign_key: "profile1_id"
  has_many :private_chats_as_profile2, class_name: "PrivateChat", foreign_key: "profile2_id"
  validate :acceptable_avatar

  def acceptable_avatar
    return unless avatar.attached?

    errors.add(:avatar, "is too large. Image must be less than 3MB.") unless avatar.byte_size <= 3.megabytes

    acceptable_types = ["image/jpeg", "image/png"]
    return if acceptable_types.include?(avatar.content_type)

    errors.add(:avatar, "must be a JPEG or PNG.")
  end

  def calculate_age
    return unless birth_date

    ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
  end
end
