class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 4 }
  validates :email, presence: true, length: { minimum: 11 }, uniqueness: true
  validates :password, length: { minimum: 6 }
  has_secure_password
end
