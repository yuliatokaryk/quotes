class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :nickname, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
