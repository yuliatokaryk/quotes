class RemoveBookFromQuotes < ActiveRecord::Migration[6.1]
  def change
    remove_reference :quotes, :book, index: true, foreign_key: true
  end
end
