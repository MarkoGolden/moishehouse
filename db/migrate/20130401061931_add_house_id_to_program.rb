class AddHouseIdToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :house_id, :integer
  end
end
