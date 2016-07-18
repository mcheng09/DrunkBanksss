class User < ActiveRecord::Base

  has_many :bets
  
  BCrypt::Engine.cost = 8
  has_secure_password

end
