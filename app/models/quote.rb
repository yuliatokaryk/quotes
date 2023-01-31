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

  def source_string
    source&.to_s
  end

  def source_string=(string)
    type, id = string.split(':')
    self.source = type.constantize.find(id)
  end
end
