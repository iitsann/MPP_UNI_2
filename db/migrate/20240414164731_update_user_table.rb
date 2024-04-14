class UpdateUserTable < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_banned, :boolean, default: false
  end
end
