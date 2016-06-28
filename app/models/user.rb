class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 4 }
  validates :email, presence: true, length: { minimum: 7 }
  has_secure_password
end
