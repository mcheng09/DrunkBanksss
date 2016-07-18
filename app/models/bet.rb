class Bet < ActiveRecord::Base

  validates :amount, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 100}

end
