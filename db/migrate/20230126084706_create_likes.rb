class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :quote, index: true, foreign_key: true

      t.timestamps
    end
  end
end
