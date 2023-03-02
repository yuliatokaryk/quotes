class ChangeColumnToBigint < ActiveRecord::Migration[6.1]
  def change
    change_column :profiles, :number, :bigint
  end
end
