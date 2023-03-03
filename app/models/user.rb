class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :authors
  has_many :books
  has_many :quotes
  has_many :likes
  has_one :profile
  has_many :quotes, as: :source

  has_many :follower_relationships, class_name: 'Follower', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, class_name: 'Following', foreign_key: 'following_id', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following

  enum role: { user: 0, superuser: 1, moderator: 2, admin: 3 }

  def source_data
    profile.nickname
  end
end
