class User < ActiveRecord::Base
  has_secure_password

  has_many :buildings
  has_many :floors
  
  validates :email, presence: true, uniqueness: true
end
