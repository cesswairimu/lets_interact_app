class User < ApplicationRecord
  attr_accessor :remember_token
  validates :username, presence: true, length: { minimum: 4 }
  validates :email, presence: true, length: { minimum: 11 }, uniqueness: true
  validates :password, length: { minimum: 6 }
  has_secure_password

  #Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #Remembers a user in the database
  def remember
    self.remember_token = User.new_token
    update_attribute( :remember_digest, User.digest(remember_token) )
  end
end
