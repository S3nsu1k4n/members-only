class User < ApplicationRecord
  has_many :post

  validates :username, :password, :email, presence: true
  validates :username, :email, uniqueness: true
end
