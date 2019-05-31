class AddFinalOutcomeToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :final_outcome, :boolean
  end
end
