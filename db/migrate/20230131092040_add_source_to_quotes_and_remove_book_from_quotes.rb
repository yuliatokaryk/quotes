# frozen_string_literal: true

class AddSourceToQuotesAndRemoveBookFromQuotes < ActiveRecord::Migration[6.1]
  def up
    add_reference :quotes, :source, polymorphic: true

    Quote.all.each do |quote|
      quote.source = Book.find_by(id: quote.book_id)
      quote.save!
    end

    remove_reference :quotes, :book, index: true, foreign_key: true
  end

  def down
    remove_reference :quotes, :source, polymorphic: true
    add_reference :quotes, :book, index: true, foreign_key: true
  end
end
