class Book < ApplicationRecord
  belongs_to :author, optional: true
  belongs_to :user
  validates :title, presence: true
end
