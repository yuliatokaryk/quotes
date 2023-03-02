class Profile < ApplicationRecord
  before_save :check_if_user_is_allowed_to_have_avatar
  belongs_to :user
  has_one_attached :avatar

  has_many :follower_relationships, class_name: 'Follower', foreign_key: 'profile_id', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, class_name: 'Following', foreign_key: 'profile_id', dependent: :destroy
  has_many :following, through: :following_relationships, source: :following

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def check_if_user_is_allowed_to_have_avatar
    return unless user.role == 'user'

    avatar.purge
  end
end
