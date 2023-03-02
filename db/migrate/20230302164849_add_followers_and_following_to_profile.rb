class AddFollowersAndFollowingToProfile < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.references :profile, foreign_key: true
      t.references :follower, foreign_key: { to_table: :profiles }
      t.timestamps
    end

    create_table :following do |t|
      t.references :profile, foreign_key: true
      t.references :following, foreign_key: { to_table: :profiles }
      t.timestamps
    end
  end
end
