class Reddit < ApplicationRecord
  paginates_per 15

  def self.ransackable_attributes(_auth_object=nil)
    %w[created_at id id_value link subreddit topic updated_at]
  end
end
