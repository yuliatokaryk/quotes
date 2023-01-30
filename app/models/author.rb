class Author < ApplicationRecord
  belongs_to :user
  has_many :books
  has_many :quotes, as: :source
  validates :first_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
