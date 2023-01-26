class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :authors
  has_many :books
  has_many :quotes
  has_many :likes
  has_one :profile

  enum role: { user: 0, superuser: 1, moderator: 2, admin: 3 }
end
