class AddRsjToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rsj, :boolean
  end
end
