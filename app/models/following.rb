class Following < ApplicationRecord
  belongs_to :user
  belongs_to :following, class_name: 'User', foreign_key: 'user_id'

  validates :user_id, uniqueness: { scope: :following_id }
end
