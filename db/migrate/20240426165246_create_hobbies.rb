class CreateHobbies < ActiveRecord::Migration[7.1]
  def change
    create_table :hobbies do |t|
      t.string :name
      t.text :profile_ids

      t.timestamps
    end
  end
end
