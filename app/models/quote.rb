class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :source, polymorphic: true
  has_many :likes

  validates :content, presence: true, length: { maximum: 1000 }

  state_machine initial: :pending do
    event :approve do
      transition pending: :approved
    end
  end

  def liked_by?(user)
    likes.exists?(user: user)
  end
end
