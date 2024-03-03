class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :username
      t.integer :user_id
      t.string :avatar_url
      t.string :region

      t.timestamps
    end
  end
end
