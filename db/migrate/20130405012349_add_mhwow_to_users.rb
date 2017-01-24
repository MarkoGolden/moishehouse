class AddMhwowToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mhwow, :boolean
  end
end
