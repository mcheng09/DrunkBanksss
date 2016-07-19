class User < ActiveRecord::Base

  has_many :bets
  has_many :volunteers, through: :bets

  BCrypt::Engine.cost = 8
  has_secure_password

end
