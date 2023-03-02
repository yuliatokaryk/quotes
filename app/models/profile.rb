class Profile < ApplicationRecord
  before_save :check_if_user_is_allowed_to_have_avatar
  belongs_to :user
  has_one_attached :avatar

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
