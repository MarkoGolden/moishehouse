class AddCategoryToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :retreat, :string
  end
end
