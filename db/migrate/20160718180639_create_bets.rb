class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.string :name
      t.integer :amount
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
