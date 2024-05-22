class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :login
      t.string :email
      t.string :gender
      t.date :birth_date
      t.integer :age
      t.string :city
      t.references :user, null: false, foreign_key: true
      t.text :hobbies

      t.timestamps
    end
  end
end
