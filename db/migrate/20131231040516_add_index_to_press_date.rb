class AddIndexToPressDate < ActiveRecord::Migration
  def change
  	add_index :presses, :date
  end
end
