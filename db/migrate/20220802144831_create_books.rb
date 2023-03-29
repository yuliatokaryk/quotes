# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year_of_publication
      t.string :wikipedia_url
      t.string :goodreads_url
      t.belongs_to :author, optional: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
