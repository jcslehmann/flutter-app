class AddReferencesToBets < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :bets, :users, column: :proposer_id, primary_key: :id
    add_foreign_key :bets, :users, column: :receiver_id, primary_key: :id
  end
end
