class CreateReddits < ActiveRecord::Migration[7.1]
  def change
    create_table :reddits do |t|
      t.string :topic
      t.string :subreddit
      t.string :link

      t.timestamps
    end
  end
end
