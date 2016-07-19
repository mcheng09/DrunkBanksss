class Volunteer < ActiveRecord::Base

  has_one :user, through: :bet
  belongs_to :bet

end
