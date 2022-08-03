class Book < ApplicationRecord
  belongs_to :author, optional: true
  belongs_to :user
  has_many :quotes
  
  validates :title, presence: true
end
