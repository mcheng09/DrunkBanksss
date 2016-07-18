class AddAmountToBets < ActiveRecord::Migration
  def change
    add_column :bets, :amount, :decimal
  end
end
