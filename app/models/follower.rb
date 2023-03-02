class Follower < ApplicationRecord
  belongs_to :profile
  belongs_to :follower, class_name: 'Profile', foreign_key: 'follower_id'
end
