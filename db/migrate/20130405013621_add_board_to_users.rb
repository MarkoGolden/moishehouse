class AddBoardToUsers < ActiveRecord::Migration
  def change
    add_column :users, :board, :boolean
  end
end
