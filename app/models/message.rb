class Message < ApplicationRecord
  belongs_to :profile
  belongs_to :private_chat
end
