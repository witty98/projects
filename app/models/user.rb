class User < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :namecn, presence: true, length: { maximum: 50 }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
