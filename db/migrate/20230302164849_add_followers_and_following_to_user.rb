class AddFollowersAndFollowingToUser < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.references :user, foreign_key: true
      t.references :follower, foreign_key: { to_table: :users }
      t.timestamps
    end

    create_table :followings do |t|
      t.references :user, foreign_key: true
      t.references :following, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
