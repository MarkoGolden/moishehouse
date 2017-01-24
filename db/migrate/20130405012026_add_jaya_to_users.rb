class AddJayaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :alumni, :boolean
    add_column :users, :rank, :integer
  end
end
