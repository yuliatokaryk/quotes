class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  validates :content, presence: true, length: { minimum: 20, maximum: 1000 }
end
