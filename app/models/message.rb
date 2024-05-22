class Message < ApplicationRecord
  belongs_to :profile
  belongs_to :private_chat

  def self.ransackable_associations(_auth_object=nil)
    %w[private_chat profile]
  end

  def self.ransackable_attributes(_auth_object=nil)
    %w[content created_at id id_value private_chat_id profile_id updated_at]
  end
end
