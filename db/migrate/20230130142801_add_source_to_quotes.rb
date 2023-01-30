class AddSourceToQuotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :quotes, :source, polymorphic: true
  end
end
