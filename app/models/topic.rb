class Topic < ApplicationRecord
  has_many :posts
  validates :name, :description, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["posts"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "name", "updated_at"]
  end
end
