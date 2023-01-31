class Book < ApplicationRecord
  belongs_to :author, optional: true
  belongs_to :user
  has_many :quotes, as: :source
  
  validates :title, presence: true

  def source_data
    self.title
  end
end
