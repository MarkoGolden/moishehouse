class AddAvatarToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :avatar, :string
  end
end
