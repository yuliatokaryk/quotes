class Author < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
end
