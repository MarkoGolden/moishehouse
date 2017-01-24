class AddMailNameToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :mail_name, :string
  end
end
