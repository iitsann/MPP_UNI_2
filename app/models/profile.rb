class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  validate :acceptable_avatar

  def acceptable_avatar
    return unless avatar.attached?

    unless avatar.byte_size <= 3.megabytes
      errors.add(:avatar, 'is too large. Image must be less than 3MB.')
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar, 'must be a JPEG or PNG.')
    end
  end

  def calculate_age
    return unless birth_date
    ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
  end
end