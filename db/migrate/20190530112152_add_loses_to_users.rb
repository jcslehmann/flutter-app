class AddLosesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :loses, :integer
  end
end
