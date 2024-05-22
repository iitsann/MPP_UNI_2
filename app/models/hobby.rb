class Hobby < ApplicationRecord
  def self.ransackable_attributes(_auth_object=nil)
    %w[created_at id id_value name profile_ids updated_at]
  end
end
