class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :private_chat, null: false, foreign_key: {to_table: :private_chats}
      t.references :profile, null: false, foreign_key: {to_table: :profiles}

      t.timestamps
    end
  end
end
