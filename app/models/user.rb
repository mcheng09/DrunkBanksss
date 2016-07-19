class User < ActiveRecord::Base

  has_many :bets
  has_many :volunteers

  BCrypt::Engine.cost = 8
  has_secure_password

end
