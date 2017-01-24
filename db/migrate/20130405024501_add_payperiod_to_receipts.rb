class AddPayperiodToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :payperiod_id, :integer
  end
end
