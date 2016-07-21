class AddUserStripeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_stripe, :string
  end
end
