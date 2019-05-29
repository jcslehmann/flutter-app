class AddColumnToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :receiver_verdict, :boolean
  end
end
