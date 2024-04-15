class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :img_link
      t.string :title
      t.text :body
      t.integer :replies
      t.integer :likes
      t.integer :dislikes
      t.references :topic, null: false, foreign_key: true
      t.timestamps
    end
  end
end
