class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 40 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end
