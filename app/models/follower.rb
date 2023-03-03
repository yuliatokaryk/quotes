class Follower < ApplicationRecord
  belongs_to :user
  belongs_to :follower, class_name: 'User', foreign_key: 'user_id'

  validates :user_id, uniqueness: { scope: :follower_id }
end
