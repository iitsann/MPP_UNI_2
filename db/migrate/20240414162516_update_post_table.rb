class UpdatePostTable < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :is_hidden, :boolean, default: false
  end
end
