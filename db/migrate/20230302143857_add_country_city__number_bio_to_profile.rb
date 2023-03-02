class AddCountryCityNumberBioToProfile < ActiveRecord::Migration[6.1]
  def up
    add_column :profiles, :country, :string
    add_column :profiles, :city, :string
    add_column :profiles, :number, :integer
    add_column :profiles, :bio, :text
  end

  def down
    remove_column :profiles, :country, :string
    remove_column :profiles, :city, :string
    remove_column :profiles, :number, :integer
    remove_column :profiles, :bio, :text
  end
end
