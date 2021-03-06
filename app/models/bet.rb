class Bet < ActiveRecord::Base

  belongs_to :user
  has_many :volunteers, dependent: :destroy

  validates :amount, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 100}

end
