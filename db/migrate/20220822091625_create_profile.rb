class CreateProfile < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.date :date_of_birth
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
