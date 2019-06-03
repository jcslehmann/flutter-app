class AddColumnToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :like, :boolean
  end
end
