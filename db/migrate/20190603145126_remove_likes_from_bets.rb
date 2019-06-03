class RemoveLikesFromBets < ActiveRecord::Migration[5.2]
  def change
    remove_column :bets, :likes, :integer
  end
end
