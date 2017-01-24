class AddJayaToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :combinechecks, :boolean
    add_column :houses, :brn_budget, :decimal, :precision => 8, :scale => 2
  end
end
