class AddClassToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :class, :string
  end
end
