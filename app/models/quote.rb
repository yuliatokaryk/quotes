class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :likes

  validates :content, presence: true, length: { maximum: 1000 }
end
