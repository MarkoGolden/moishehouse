class ChangeJayaInReceipts < ActiveRecord::Migration
  def change
    rename_column :receipts, :budget_id, :purpose_id
    change_column :rents, :adjustment, :decimal, :precision => 8, :scale => 2 
    change_column :rents, :amount, :decimal, :precision => 8, :scale => 2 
    change_column :tiers, :amount, :decimal, :precision => 8, :scale => 2 
    change_column :grants, :amount, :decimal, :precision => 8, :scale => 2 
  end

end
