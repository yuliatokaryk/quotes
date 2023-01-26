class AddStateToQuote < ActiveRecord::Migration[6.1]
  def change
    add_column :quotes, :state, :string, default: 'pending'
  end
end
