class AddBlahToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :international, :string
    add_column :houses, :calendar_url, :text
    add_column :houses, :director_id, :integer
  end
end
