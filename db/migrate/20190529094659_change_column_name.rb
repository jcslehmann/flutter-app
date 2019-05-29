class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :bets, :outcome, :proposer_verdict
  end
end
