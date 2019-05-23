class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.integer :stake
      t.float :odds
      t.text :proposition
      t.datetime :deadline
      t.string :status
      t.boolean :outcome
      t.integer :likes
      t.integer :proposer_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
