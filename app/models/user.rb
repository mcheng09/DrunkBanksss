class User < ActiveRecord::Base

  BCrypt::Engine.cost = 8
  has_secure_password

end
