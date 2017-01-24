class AddStuffToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :text
    add_column :users, :house_id, :integer
    add_column :users, :mail_address, :string
    add_column :users, :mail_city, :string
    add_column :users, :mail_state, :string
    add_column :users, :mail_zip, :string
    add_column :users, :mail_country, :string
    add_column :users, :mail_check_name, :string
  end
end
