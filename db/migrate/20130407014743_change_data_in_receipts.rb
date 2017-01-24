class ChangeDataInReceipts < ActiveRecord::Migration
  def change
    change_column :receipts, :amount, :decimal, :precision => 8, :scale => 2
  end

end
