class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :wikipedia_url
      t.string :goodreads_url
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
