class AddVerifiedColumnToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :consensus_reached, :boolean
  end
end
