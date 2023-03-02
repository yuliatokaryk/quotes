class Following < ApplicationRecord
  belongs_to :profile
  belongs_to :following, class_name: 'Profile', foreign_key: 'follower_id'
end
