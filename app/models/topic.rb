class Topic < ApplicationRecord
  has_many :posts
  validates :name, :description, presence: true

  def self.ransackable_associations(_auth_object=nil)
    ["posts"]
  end

  def self.ransackable_attributes(_auth_object=nil)
    %w[created_at description id id_value name updated_at]
  end
end
