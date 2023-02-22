class Profile < ApplicationRecord
  before_save :remove_avatar
  belongs_to :user
  has_one_attached :avatar

  validates :nickname, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def remove_avatar
    return unless user.role == 'user'

    self.avatar = nil
  end
end
