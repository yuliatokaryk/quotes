# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :authors
  has_many :books
  has_many :quotes
  has_many :likes
  has_one :profile

  has_many :follower_relationships, class_name: 'Follow', foreign_key: 'following_id'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :following, through: :following_relationships, source: :following

  enum role: { user: 0, superuser: 1, moderator: 2, admin: 3 }
end
