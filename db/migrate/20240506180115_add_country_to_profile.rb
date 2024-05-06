class AddCountryToProfile < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :country, :string
  end
end
