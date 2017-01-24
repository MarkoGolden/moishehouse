class AddSavingsToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :budget_savings, :float
  end
end
