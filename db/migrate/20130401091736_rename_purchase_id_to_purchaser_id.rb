class RenamePurchaseIdToPurchaserId < ActiveRecord::Migration
  def up
    rename_column :receipts, :purchase_id, :purchaser_id
  end

  def down
    rename_column :receipts, :purchaser_id, :purchase_id
  end
end
