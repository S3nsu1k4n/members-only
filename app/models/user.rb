class User < ApplicationRecord
  has_many :posts

  validates :username, :password, :email, presence: true
  validates :username, :email, uniqueness: true
end
