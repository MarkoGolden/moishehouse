class AddStuffToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :avatar_file_name, :string
  end
end
