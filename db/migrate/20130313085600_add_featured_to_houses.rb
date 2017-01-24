class AddFeaturedToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :featured, :boolean
  end
end
